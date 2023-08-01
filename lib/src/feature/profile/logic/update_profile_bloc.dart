// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/profile.dart';
import 'package:fevent/src/network/model/update_profile.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/widgets/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "update_profile_state.dart";

class UpdateProfileBloc extends Cubit<UpdateProfileState> {
  UpdateProfileBloc() : super(const UpdateProfileState()) {
    init();
  }
  Domain get _domain => GetIt.I<Domain>();

  void init() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result = await _domain.authRepository.getProfile(token);
    if (result.isSuccess) {
      emit(state.copyWith(profile: result.data!));
      onChangedName(result.data?.name ?? "");
      onChangedPhone(result.data?.phone ?? "");
      onChangedMajor(result.data?.major ?? "");
      onChangedCourse((result.data?.semester ?? "").toString());
      emit(state.copyWith(birthDay: result.data?.dateOfBirth));
    }
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedPhone(String value) {
    emit(state.copyWith(phone: value));
  }

  void onChangedMajor(String value) {
    emit(state.copyWith(major: value));
  }

  void onChangedCourse(String value) {
    emit(state.copyWith(course: value));
  }

  void update(BuildContext context) async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result = await _domain.authRepository.updateProfile(
      token: token,
      dateOfBirth: state.birthDay,
      major: state.major,
      name: state.name,
      phone: state.phone,
      semester: state.course,
    );
    if (result.isSuccess) {
      Navigator.pop(context);
      XToast.success("Thành công");
    } else {
      Navigator.pop(context);
      XToast.error("Lỗi");
    }
  }
}
