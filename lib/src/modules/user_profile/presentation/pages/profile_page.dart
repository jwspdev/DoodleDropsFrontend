import 'package:doodle_drops/src/core/widgets/sized_boxes.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/get_user_details/user_response.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_details_response_entity.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_response_entity.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/user_profile/presentation/widgets/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthenticationState) {
            return ProfileView(
              userDetailsResponseEntity: state.userResponse!.userDetailsResponse
                  as UserDetailsResponseEntity,
              isPersonal: true,
            );
          }
          return Container();
        });
  }
}
