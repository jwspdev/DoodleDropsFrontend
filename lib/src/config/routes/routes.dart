import 'package:doodle_drops/src/modules/auth/presentation/pages/login_page.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/register_page.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/splash_screen.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:doodle_drops/src/modules/home_page/landing_page.dart';
import 'package:doodle_drops/src/modules/user_profile/presentation/pages/edit_profile_page.dart';
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
      var authState = context.read<AuthBloc>().state;
      var authStatus = authState.authenticationStatus;

      debugPrint('STATUS: $authStatus');
      if (authStatus == AuthenticationStatus.authenticated) {
        if (authState is AuthenticationState) {
          var userResponse = authState.userResponse;
          var firstName =
              userResponse?.userDetailsResponse?.userProfileResponse?.firstName;
          if (firstName != null && firstName.isNotEmpty) {
            return LandingPage.routePath;
          } else {
            return EditProfilePage.routePath;
          }
        } else {
          return SplashScreen.routePath;
        }
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
      GoRoute(
          path: EditProfilePage.routePath,
          builder: (_, __) => const EditProfilePage()),
      GoRoute(path: LoginPage.routePath, builder: (_, __) => const LoginPage()),
      GoRoute(
          path: SplashScreen.routePath,
          builder: (context, state) => const SplashScreen())
    ]);
