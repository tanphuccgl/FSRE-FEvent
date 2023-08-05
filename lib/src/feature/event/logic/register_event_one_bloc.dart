import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/event_detail.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/widgets/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../utils/helper/radius.dart';

part "register_event_one_state.dart";

class RegisterEventOneBloc extends Cubit<RegisterEventOneState> {
  final String eventId;
  RegisterEventOneBloc(this.eventId) : super(const RegisterEventOneState()) {
    getEvent();
  }

  Domain get _domain => GetIt.I<Domain>();

  void getEvent() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result = await _domain.eventRepository.getEvent(eventId, token);
    if (result.isSuccess) {
      emit(state.copyWith(eventModel: result.data));
    }
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedCode(String value) {
    emit(state.copyWith(code: value));
  }

  void onChangedPhone(String value) {
    emit(state.copyWith(phone: value));
  }

  void onChangedEmail(String value) {
    emit(state.copyWith(email: value));
  }

  void onRegisterButton(BuildContext context) async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    if (state.code.isEmpty ||
        state.email.isEmpty ||
        state.name.isEmpty ||
        state.phone.isEmpty) {
      return;
    }

    final result =
        await _domain.eventRepository.postRegisterEvent(eventId, token);
    if (result.isSuccess) {
      // ignore: use_build_context_synchronously
      success(context);
    } else {
      XToast.error("Lỗi");
    }
  }

  void success(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: const Text(
            'CHÚC MỪNG BẠN ĐÃ ĐĂNG\nKÝ THAM GIA SỰ KIỆN\nTHÀNH CÔNG!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.green, fontSize: 19, fontWeight: FontWeight.bold),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderHelper.r10),
                      maximumSize: const Size(250, 40)),
                  onPressed: () => XCoordinator.showEventDetail1(eventId),
                  child: const Text(
                    "XÁC NHẬN",
                  )),
            ),
          ],
        );
      },
    );
  }
}
