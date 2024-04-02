part of 'profile_navigation_bloc.dart';

sealed class ProfileNavigationEvent extends Equatable {
  const ProfileNavigationEvent();

  @override
  List<Object> get props => [];
}

class TabChangeEvent extends ProfileNavigationEvent {
  final int tabIndex;

  const TabChangeEvent({required this.tabIndex});
  @override
  List<Object> get props => [tabIndex];
}
