import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/check_participants.dart';

import 'package:fevent/src/network/model/event_detail.dart';
import 'package:fevent/src/router/coordinator.dart';

import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/utils/helper/radius.dart';
import 'package:fevent/src/widgets/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "detail_event_state.dart";

class DetailEventBloc extends Cubit<DetailEventState> {
  final String eventId;
  DetailEventBloc(this.eventId) : super(const DetailEventState()) {
    initial();
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

  void initial() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    final result =
        await _domain.eventRepository.checkRegisterEvent(eventId, token);
    if (result.isSuccess) {
      emit(state.copyWith(data: result.data));
    }
  }

  void onRemoveRegisterEventButton(BuildContext context) async {
    showDialogDelete(context);
  }

  void deleteEventRegister() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    final result = await _domain.eventRepository
        .removeRegisterEvent(state.data?.participantId ?? "", token);
    if (result.isSuccess) {
      initial();
    } else {
      XToast.error("Lỗi");
    }
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

  void postTicketEvent() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result =
        await _domain.eventRepository.postTicketEvent(eventId, token);
    if (result.isSuccess) {
      XCoordinator.showEventTicketSuccess();
    } else {
      XToast.error("Lỗi");
    }
  }
}
