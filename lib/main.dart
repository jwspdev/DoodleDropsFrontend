import 'package:doodle_drops/src/config/routes/routes.dart';
import 'package:doodle_drops/src/dependency_injection/injection_container.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:doodle_drops/src/modules/tags/presentation/bloc/tag_bloc.dart';
import 'package:doodle_drops/src/tests/api_tests/auth_tests.dart';
import 'package:doodle_drops/src/tests/api_tests/tag_tests.dart';
import 'package:doodle_drops/src/tests/api_tests/user_tests.dart';
import 'package:doodle_drops/src/tests/post_tests/PostTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  // AuthTests.testGetCurrentUser();
  // test();
  // UserTests.testUpdateUser();
  // TagTest.listTags();
  // TagTest.testUserLikeTags();
  // PostTest.testGetPostList();
  // PostTest.testGetUserLikedPost();
  runApp(const MainApp());
}

void test() {
  debugPrint('Hello!');
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time');
    var duration = const Duration(seconds: 1);
    if (firstTime != null && !firstTime) {
      return Timer(duration, () {});
    } else {
      prefs.setBool('first_time', false);
      return Timer(duration, () {});
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
