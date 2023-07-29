import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/profile.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/services/auth_service.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  final BuildContext context;
  ProfileBloc(this.context) : super(const ProfileState()) {
    init();
  }
  Domain get _domain => GetIt.I<Domain>();

  void init() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result = await _domain.authRepository.getProfile(token);
    if (result.isSuccess) {
      emit(state.copyWith(profile: result.data!));
    }
  }

  Future<void> logout() async {
    await _domain.authRepository.logout();

    Authentication.signOut();
    UserPrefs().saveUser(null);

    XCoordinator.logoutAndShowSignIn();
  }
}
