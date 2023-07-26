import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/widgets/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../utils/helper/radius.dart';

part "register_event_two_state.dart";

class RegisterEventTwoBloc extends Cubit<RegisterEventTwoState> {
  final String eventId;
  RegisterEventTwoBloc(this.eventId) : super(RegisterEventTwoState()) {
    getEvent();
  }

  Domain get _domain => GetIt.I<Domain>();

  void getEvent() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result = await _domain.eventRepository.getEvent(eventId, token);
    if (result.isSuccess) {
      emit(state.copyWith(event: result.data));
    }
  }

  void onRegisterButton(BuildContext context) async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    final result =
        await _domain.eventRepository.postRegisterEvent(eventId, token);
    if (result.isSuccess) {
      // ignore: use_build_context_synchronously
      success(context);
    } else {
      XToast.error("Lỗi");
    }
  }

  void onRemoveRegisterEventButton(BuildContext context) async {
    showDialogDelete(context);
  }

  void deleteEventRegister() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    final result =
        await _domain.eventRepository.removeRegisterEvent(eventId, token);
    if (result.isSuccess) {
      // ignore: use_build_context_synchronously
    } else {
      XToast.error("Lỗi");
    }
  }

  void success(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: const Text(
            'CHÚC MỪNG BẠN ĐÃ ĐĂNG\nKÝ THAM VIỆC LÀM THÊM\nTHÀNH CÔNG!',
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
                  onPressed: () {
                    if (state.event == null) return;
                    XCoordinator.showEventDetail1(state.event!);
                  },
                  child: const Text(
                    "XÁC NHẬN",
                  )),
            ),
          ],
        );
      },
    );
  }

  void showDialogDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: const Text(
            'BẠN CÓ MUỐN HỦY ĐĂNG KÝ\nSỰ KIỆN KHÔNG?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 19,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Column(
              children: [
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderHelper.r10),
                          maximumSize: const Size(250, 40)),
                      onPressed: () {
                        deleteEventRegister();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "XÁC NHẬN",
                      )),
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderHelper.r10),
                          maximumSize: const Size(250, 40)),
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        "HỦY",
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
