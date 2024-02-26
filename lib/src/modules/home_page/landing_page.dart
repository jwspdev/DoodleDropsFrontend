import 'package:doodle_drops/src/modules/auth/presentation/pages/splash_screen.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static String routePath = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authenticationStatus ==
              AuthenticationStatus.unauthenticated) {
            context.go(SplashScreen.routePath);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Text("BALAY")),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(LogoutUserEvent());
                },
                child: const Text('test'))
          ],
        ),
      ),
    );
  }
}

/**
 * 

 */