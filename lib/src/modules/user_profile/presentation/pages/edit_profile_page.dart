import 'dart:ui';

import 'package:doodle_drops/src/core/widgets/sized_boxes.dart';
import 'package:doodle_drops/src/modules/auth/presentation/pages/splash_screen.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:doodle_drops/src/modules/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  static String routePath = '/edit_profile_screen';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _displayNameController;
  late TextEditingController _firstNameController;
  late TextEditingController _middleNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _ageController;
  late TextEditingController _birthdayController;

  @override
  void initState() {
    _displayNameController = TextEditingController();
    _firstNameController = TextEditingController();
    _middleNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _ageController = TextEditingController();
    _birthdayController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

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
        child: Container(
          color: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                    "Edit Profile",
                    style: TextStyle(fontSize: 20),
                  ),
                  Stack(children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          // const Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Text(
                          //     "Register",
                          //     style: TextStyle(
                          //         fontSize: 36, fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                          // const SmallestHeightedSizedBox(),
                          const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Display Name")),
                          AuthTextField(
                              obscureText: false,
                              controller: _firstNameController),
                          const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("First Name")),
                          AuthTextField(
                              obscureText: false,
                              controller: _firstNameController),
                          const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Middle Name")),
                          AuthTextField(
                              obscureText: false,
                              controller: _firstNameController),
                          const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Last Name")),
                          AuthTextField(
                              obscureText: false,
                              controller: _displayNameController),
                          const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Age")),
                          AuthTextField(
                              obscureText: false,
                              controller: _firstNameController),
                          const SmallestHeightedSizedBox(),
                          const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Birthday")),
                          AuthTextField(
                            obscureText: true,
                            controller: _middleNameController,
                          ),
                          MediumHeightedSizedBox(),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue.shade800,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  // _registerUser(context);
                                },
                                child: const Text('Apply Changes')),
                          ),
                        ],
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
}
