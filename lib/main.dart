import 'package:dio/dio.dart';
import 'package:doodle_drops/src/config/routes/routes.dart';
import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/dependency_injection/injection_container.dart';
import 'package:doodle_drops/src/modules/auth/data/data_sources/remote/authentication_api_service.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/login_user/login_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/register_user/register_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/repositories/user_auth_repository_impl.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  initializeDependencies();
  runApp(const MainApp());
}

void testRegister() async {
  final dio = Dio();
  final authService = AuthenticationApiService(dio);

  try {
    const registerUserRequest =
        RegisterUserRequest(email: 'warrenastig3', password: 'warrenpogier');

    final requestBody = registerUserRequest.toJson();

    final response = await authService
        .register(registerUserRequest)
        .then((value) => debugPrint('$value'));

    // debugPrint('Reponse Status Code: ${response.response.statusCode}');
    // debugPrint('Response Data: ${response.response}');
  } catch (error) {
    debugPrint('Error: $error');
  }
}

void testLogin() async {
  final dio = Dio();
  final authService = AuthenticationApiService(dio);
  final UserAuthRepositoryImplementation userAuthRepository =
      UserAuthRepositoryImplementation(authService);

  try {
    const loginUserRequest =
        LoginUserRequest(email: 'warren', password: 'ecinlodi');
    final response = await userAuthRepository.getUserToken(loginUserRequest);
    debugPrint('Response status code: ${response.data}');
    if (response is DataSuccess) {
      debugPrint(response.data!.message);
    } else {
      debugPrint('${response.exception}');
    }
  } catch (error) {
    debugPrint('Error $error');
  }
}

//[x] IF THE APP IS FRESHLY INSTALLED, REDIRECT TO LOGIN PAGE.
//[x] ELSE: REDIRECT TO SPLASH SCREEN, CHECK IF USER IS AUTHENTICATED (HAS TOKEN IN SECURED_STORAGE), IF NO, REDIRECT TO LOGIN PAGE
//[x] ELSE: GO TO HOME

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time');
    var duration = const Duration(seconds: 3);
    if (firstTime != null && !firstTime) {
      return Timer(duration, () {
        debugPrint('di ko po first TIME');
      });
    } else {
      prefs.setBool('first_time', false);
      return Timer(duration, () {
        debugPrint('FIRST TIME ko po');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (context) => sl()..add(CheckIfAuthenticatedEvent())),
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ));
  }
}

Widget checkState(var state) {
  if (state == AuthenticationStatus.authenticated) {
    return Text('authenticated: $state');
  }
  if (state == AuthenticationStatus.unauthenticated) {
    return Text('unauthenticated: $state');
  } else {
    return Text('unknown: $state');
  }
}

/**
 child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                switch (state.authenticationStatus) {
                  case AuthenticationStatus.authenticated:
                    context.goNamed(TestHome.routePath);
                    break;
                  case AuthenticationStatus.unauthenticated:
                    context.goNamed(LoginPage.routePath);
                    break;
                  case AuthenticationStatus.unknown:
                    context.goNamed(SplashScreen.routePath);
                    break;
                  case null:
                    break;
                }
              },
              child: const SplashScreen(),
            ),
          ),
        ));
 */
