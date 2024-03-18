import 'package:doodle_drops/src/dependency_injection/injection_container.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/login_page.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/register_page.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/splash_screen.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:doodle_drops/src/modules/home_page/landing_page.dart';
import 'package:doodle_drops/src/modules/tags/data/models/tag_model.dart';
import 'package:doodle_drops/src/modules/tags/domain/entities/tag_entity.dart';
import 'package:doodle_drops/src/modules/tags/presentation/bloc/tag_bloc.dart';
import 'package:doodle_drops/src/modules/tags/presentation/pages/add_tags_page.dart';
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
      var authState = context.read<AuthBloc>().state;
      var authStatus = authState.authenticationStatus;
      debugPrint('ROUTER: $authStatus');
      if (authStatus == AuthenticationStatus.authenticated) {
        if (authState is AuthenticationState) {
          var userResponse = authState.userResponse;
          debugPrint('router: ${userResponse}');
          List<TagEntity>? tagModels =
              userResponse?.userDetailsResponse!.likedTags;
          if (tagModels!.isNotEmpty) {
            return LandingPage.routePath;
          } else {
            return AddTagsPage.routePath;
          }
        } else {
          return SplashScreen.routePath;
        }
      } else if (authStatus == AuthenticationStatus.unauthenticated ||
          authStatus == null) {
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
          builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: AddTagsPage.routePath,
        builder: (context, state) {
          return BlocProvider<TagBloc>(
            create: (context) => sl()..add(const GetTagList()),
            child: const AddTagsPage(),
          );
        },
      )
    ]);
