import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_navigation_event.dart';
part 'profile_navigation_state.dart';

class ProfileNavigationBloc
    extends Bloc<ProfileNavigationEvent, ProfileNavigationState> {
  // PageController controller = PageController(initialPage: 0);
  ProfileNavigationBloc() : super(const ProfileNavigationInitial(tabIndex: 0)) {
    on<ProfileNavigationEvent>((event, emit) {});
    on<TabChangeEvent>(_onTabChange);
  }

  _onTabChange(TabChangeEvent event, Emitter<ProfileNavigationState> emit) {
    debugPrint('${event.tabIndex}');
    // controller.jumpToPage(event.tabIndex);
    emit(ProfileNavigationInitial(tabIndex: event.tabIndex));
  }
}
