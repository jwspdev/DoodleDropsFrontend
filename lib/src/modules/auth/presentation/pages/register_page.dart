import 'dart:ui';

import 'package:doodle_drops/src/core/widgets/sized_boxes.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/login_page.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String routePath = '/register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _displayNameController;
  bool _isBlurred = false;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _displayNameController = TextEditingController();

    super.initState();
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
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.white,
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 3),
                content: Text(
                  'Registered Successfully',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )));
            Future.delayed(const Duration(seconds: 3), () {
              context.pop();
            });
          }
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.white,
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 3),
                content: Text(
                  'Error Creating User',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )));
            setState(() {
              _isBlurred = false;
            });
            _usernameController.clear();
            _passwordController.clear();
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
                  Stack(children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SmallestHeightedSizedBox(),
                          const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Display Name")),
                          AuthTextField(
                              obscureText: false,
                              controller: _displayNameController),
                          const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Email")),
                          AuthTextField(
                              obscureText: false,
                              controller: _usernameController),
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
                                  // _registerUser(context);
                                  _registerUser(context);
                                },
                                child: const Text('Sign Up')),
                          ),
                        ],
                      ),
                    ),
                    if (_isBlurred) // Conditionally adding blur effect
                      Positioned.fill(
                        left: MediaQuery.of(context).size.width * 0.125,
                        top: MediaQuery.of(context).size.width * 0.25,
                        bottom: MediaQuery.of(context).size.width * 0.25,
                        right: MediaQuery.of(context).size.width * 0.125,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CupertinoActivityIndicator(
                                    radius: 16,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text('Registering User',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerUser(BuildContext context) {
    toggle();
    Future.delayed(const Duration(seconds: 3), () {
      BlocProvider.of<AuthBloc>(context).add(RegisterUserEvent(
          email: _usernameController.text,
          password: _passwordController.text,
          displayName: _displayNameController.text));
    });
  }

  void toggle() {
    setState(() {
      _isBlurred = !_isBlurred;
    });
  }
}
