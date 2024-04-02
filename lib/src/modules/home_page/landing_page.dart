import 'package:doodle_drops/src/modules/auth/presentation/pages/splash_screen.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:doodle_drops/src/modules/posts/presentation/pages/post_list_page.dart';
import 'package:doodle_drops/src/modules/user_profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  static String routePath = '/home_screen';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;
  var titles = ['Home Page', 'Profile Page'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${titles.elementAt(_selectedIndex)}'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      extendBody: true,
      body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.authenticationStatus ==
                AuthenticationStatus.unauthenticated) {
              context.go(SplashScreen.routePath);
            }
          },
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: const [
              PostListPage(),
              ProfilePage(),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        shape: CircleBorder(),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        height: kBottomNavigationBarHeight,
        color: Colors.cyan.shade400,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 100,
              height: kBottomNavigationBarHeight,
              child: InkWell(
                child: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? Colors.black : Colors.white,
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                    pageController.jumpToPage(_selectedIndex);
                  });
                },
              ),
            ),
            SizedBox(
              height: kBottomNavigationBarHeight,
              width: 100,
              child: InkWell(
                child: Icon(
                  Icons.person,
                  color: _selectedIndex == 1 ? Colors.black : Colors.white,
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                    pageController.jumpToPage(_selectedIndex);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
