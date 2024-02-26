import 'package:doodle_drops/src/core/widgets/sized_boxes.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/register_page.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/splash_screen.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:doodle_drops/src/modules/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routePath = '/login_page';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (_, state) {
        if (state is AuthenticationState) {
          if (state.authenticationStatus ==
              AuthenticationStatus.authenticated) {
            context.go(SplashScreen.routePath);
          }
        }
      },
      child: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 56,
                ),
                const SmallerHeightedSizedBox(),
                const Text(
                  "DoodleDrops",
                  style: TextStyle(fontSize: 36),
                ),
                const MediumHeightedSizedBox(),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SmallestHeightedSizedBox(),
                      const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("Username")),
                      AuthTextField(
                          obscureText: false, controller: _usernameController),
                      const SmallestHeightedSizedBox(),
                      const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("Password")),
                      AuthTextField(
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      const Align(
                          alignment: Alignment.centerRight,
                          child: Text("forget username or password?")),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade800,
                                foregroundColor: Colors.white),
                            onPressed: () {
                              _loginUser(context);
                            },
                            child: const Text('Login')),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white),
                              onPressed: () {
                                _goToRegisterPage(context);
                              },
                              child: const Text('Sign Up'))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void _loginUser(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(LoginUserEvent(
        email: _usernameController.text, password: _passwordController.text));
  }

  void _goToRegisterPage(BuildContext context) {
    context.push(RegisterPage.routePath);
  }
}
