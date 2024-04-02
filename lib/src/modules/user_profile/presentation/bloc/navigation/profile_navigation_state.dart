part of 'profile_navigation_bloc.dart';

sealed class ProfileNavigationState extends Equatable {
  final int tabIndex;
  const ProfileNavigationState({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}

final class ProfileNavigationInitial extends ProfileNavigationState {
  const ProfileNavigationInitial({required super.tabIndex});
}
