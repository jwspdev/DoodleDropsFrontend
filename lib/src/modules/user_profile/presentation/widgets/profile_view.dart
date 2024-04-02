import 'package:doodle_drops/src/core/widgets/custom_navigation_tab.dart';
import 'package:doodle_drops/src/core/widgets/custom_text_style.dart';
import 'package:doodle_drops/src/core/widgets/horizontal_container.dart';
import 'package:doodle_drops/src/core/widgets/sized_boxes.dart';
import 'package:doodle_drops/src/dependency_injection/injection_container.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_details_response_entity.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_profile_response_entity.dart';
import 'package:doodle_drops/src/modules/posts/domain/entities/responses/post_with_extras_entity.dart';
import 'package:doodle_drops/src/modules/posts/presentation/bloc/post_bloc.dart';
import 'package:doodle_drops/src/modules/posts/presentation/pages/post_list_page.dart';
import 'package:doodle_drops/src/modules/user_profile/presentation/bloc/navigation/profile_navigation_bloc.dart';
import 'package:doodle_drops/src/modules/user_profile/presentation/widgets/profile_about_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  final UserDetailsResponseEntity userDetailsResponseEntity;
  final bool isPersonal;
  const ProfileView(
      {super.key,
      required this.userDetailsResponseEntity,
      required this.isPersonal});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int selectedTabIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (context) => sl()..add(const GetPostListEvent(userId: 91)),
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return _buildUserDetails(widget.userDetailsResponseEntity);
        },
      ),
    );
  }

  Widget test(List<PostWithExtrasEntity> objects) {
    List<Widget> list = [];
    for (var object in objects) {
      list.add(Text('$object'));
    }

    return Column(
      children: list,
    );
  }

  Widget _buildUserDetails(
      UserDetailsResponseEntity userDetailsResponseEntity) {
    var userProfile = userDetailsResponseEntity.userProfileResponse;
    return BlocProvider<ProfileNavigationBloc>(
        create: (context) =>
            ProfileNavigationBloc()..add(const TabChangeEvent(tabIndex: 0)),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildUserProfile(userProfile),
              const SmallestHeightedSizedBox(),
              _buildProfileNavigationContainer(),
              _buildProfilePageView(),
            ],
          ),
        ));
  }

  Widget _buildUserProfile(UserProfileResponseEntity? userProfile) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CircleAvatar(
          radius: 40,
        ),
        const SmallestHeightedSizedBox(),
        Text(
          '${userProfile?.displayName}',
          style: openSansBoldText(fontSize: 20),
        ),
        Text(
          '${userProfile?.firstName} ${userProfile?.lastName}',
          style: openSansRegular(),
        ),
        const SmallHeightedSizedBox(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Text(
                  '0 Following',
                  style: openSansMedium(),
                ),
              ),
              InkWell(
                child: Text(
                  '2 Followers',
                  style: openSansMedium(),
                ),
              ),
              InkWell(
                child: Text(
                  '3 Doodles',
                  style: openSansMedium(),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildProfileNavigationContainer() {
    List tabs = [
      {
        "name": "Doodles",
        "isSelected": true,
      },
      {
        "name": "Likes",
        "isSelected": false,
      },
      {
        "name": "About",
        "isSelected": false,
      }
    ];
    if (widget.isPersonal == false) {
      tabs.removeAt(1);
    }
    return HorizontalContainer(
        anyWidget: SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tabs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTabIndex = index;
                    BlocProvider.of<ProfileNavigationBloc>(context)
                        .add(TabChangeEvent(tabIndex: index));
                  });
                },
                child: CustomNavigationTab(
                  title: tabs[index]['name'],
                  isSelected: index == selectedTabIndex,
                ),
              ),
            );
          }),
    ));
  }

  Widget _buildProfilePageView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<ProfileNavigationBloc, ProfileNavigationState>(
          builder: (context, state) {
        if (state.tabIndex == 2) {
          return ProfileAboutPage(
              userDetailsResponseEntity: widget.userDetailsResponseEntity);
        }
        if (state.tabIndex == 1) {
          return const Text('1');
        }
        if (state.tabIndex == 0) {
          return Column(
            children: [
              PostListPage(
                userId: widget.userDetailsResponseEntity.id,
              )
            ],
          );
        }
        return const Text('pulos');
      }),
    );
  }
}
