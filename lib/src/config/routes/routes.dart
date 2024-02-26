import 'dart:async';

import 'package:doodle_drops/src/modules/auth/presentation/pages/login_page.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/register_page.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/splash_screen.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:doodle_drops/src/modules/home_page/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: SplashScreen.routePath,
    redirect: (context, state) {
      if (state.fullPath == RegisterPage.routePath) {
        return RegisterPage.routePath;
      }
      // BlocProvider.of<AuthBloc>(context).add(CheckIfAuthenticatedEvent())
      var authStatus = context.read<AuthBloc>().state.authenticationStatus;
      debugPrint('STATUS: $authStatus');
      if (authStatus == AuthenticationStatus.authenticated) {
        return LandingPage.routePath;
      } else if (authStatus == AuthenticationStatus.unauthenticated) {
        return LoginPage.routePath;
      } else {
        return SplashScreen.routePath;
      }
    },
    routes: [
      GoRoute(
          path: RegisterPage.routePath,
          name: "register_page",
          builder: (_, __) => const RegisterPage()),
      GoRoute(
          path: LandingPage.routePath, builder: (_, __) => const LandingPage()),
      GoRoute(path: LoginPage.routePath, builder: (_, __) => const LoginPage()),
      GoRoute(
          path: SplashScreen.routePath,
          builder: (context, state) => const SplashScreen())
    ]);
