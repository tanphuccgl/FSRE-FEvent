// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:fevent/src/feature/float_bottom_navigation/cubit/bottom_navigation_bloc.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/event_detail.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/widgets/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../utils/helper/radius.dart';

part "donate_event_state.dart";

class DonateEventBloc extends Cubit<DonateEventState> {
  final String eventId;
  DonateEventBloc(this.eventId) : super(const DonateEventState()) {
    getEvent();
    onChangedNumber("0");
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

  void onChangedNumber(String value) {
    emit(state.copyWith(number: double.tryParse(value)));
  }

  void onChangedNote(String value) {
    emit(state.copyWith(note: value));
  }

  void onDonateButton(BuildContext context) async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    if (state.note.isEmpty || state.number == 0.0) {
      return;
    }

    final result = await _domain.eventRepository.postDonateEvent(
      amount: state.number,
      eventId: eventId,
      token: token,
      note: state.note,
    );
    if (result.isSuccess) {
      success(context);
      onChangedNumber("0");
    } else {
      if (result.error == "payment") {
        error(context);
        onChangedNumber("0");
      }

      XToast.error("Lỗi");
    }
  }

  void success(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: const Text(
            'CHÚC MỪNG BẠN ĐÃ\nQUYÊN GÓP THÀNH CÔNG!',
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
                    Navigator.pop(context);
                    Navigator.pop(context);
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

  void error(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: const Text(
            'SỐ TIỀN TRONG VÍ KHÔNG\nĐỦ!  VUI LÒNG KIỂM TRA.',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderHelper.r10),
                        maximumSize: const Size(110, 55)),
                    onPressed: () {
                      Navigator.pop(context);
                      //   Navigator.pop(context);
                    },
                    child: const Text(
                      "XÁC NHẬN",
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderHelper.r10),
                        maximumSize: const Size(110, 55)),
                    onPressed: () {
                      XCoordinator.replaceDashboard();

                      context.read<BottomNavigationBloc>().onItemTapped(2);
                    },
                    child: const Text(
                      "NẠP TIỀN",
                    )),
              ],
            ),
          ],
        );
      },
    );
  }
}
