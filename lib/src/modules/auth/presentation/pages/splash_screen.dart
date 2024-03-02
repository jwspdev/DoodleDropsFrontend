import 'package:doodle_drops/src/modules/auth/presentation/pages/login_page.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:doodle_drops/src/modules/home_page/landing_page.dart';
import 'package:doodle_drops/src/modules/user_profile/presentation/pages/edit_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routePath = '/';
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticationState) {
          switch (state.authenticationStatus) {
            case AuthenticationStatus.authenticated:
              if (state.userResponse!.userDetailsResponse!.userProfileResponse!
                  .firstName!.isEmpty) {
                debugPrint('yes');
                context.go(EditProfilePage.routePath);
              } else {
                debugPrint('no');
                context.go(LandingPage.routePath);
              }
              break;
            case AuthenticationStatus.unauthenticated:
              context.go(LoginPage.routePath);
              break;
            case AuthenticationStatus.unknown:
              // Handle unknown status if needed
              break;
            default:
              // Handle other status if needed
              break;
          }
        }
      },
      child: Scaffold(body: Text('splash screen')),
    );
  }
}
