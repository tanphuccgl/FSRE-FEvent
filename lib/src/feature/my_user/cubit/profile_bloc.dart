import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/services/auth_service.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  final BuildContext context;
  ProfileBloc(this.context) : super(const ProfileState());
  Domain get _domain => GetIt.I<Domain>();

  Future<void> logout() async {
    await _domain.authRepository.logout();

    Authentication.signOut();
    UserPrefs().saveUser(null);

    XCoordinator.logoutAndShowSignIn();
  }
}
