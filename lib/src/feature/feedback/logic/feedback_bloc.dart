import 'package:equatable/equatable.dart';
import 'package:fevent/src/feature/float_bottom_navigation/cubit/bottom_navigation_bloc.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/utils/helper/radius.dart';
import 'package:fevent/src/widgets/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "feedback_state.dart";

class FeedbackBloc extends Cubit<FeedbackState> {
  final String eventId;
  FeedbackBloc(this.eventId) : super(const FeedbackState());

  Domain get _domain => GetIt.I<Domain>();

  void onChangedValue1(int value) {
    emit(state.copyWith(value1: value));
  }

  void onChangedValue2(int value) {
    emit(state.copyWith(value2: value));
  }

  void onChangedValue3(int value) {
    emit(state.copyWith(value3: value));
  }

  void onChangedValue4(int value) {
    emit(state.copyWith(value4: value));
  }

  void onChangedText1(String value) {
    emit(state.copyWith(text1: value));
  }

  void onChangedText2(String value) {
    emit(state.copyWith(text2: value));
  }

  void onButton(BuildContext context) async {
    if (state.text1.isEmpty || state.text2.isEmpty) {
      return;
    }

    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    final result = await _domain.eventRepository.postFeedback(
      satisfaction: state.value1,
      contentQuality: state.value2,
      organization: state.value3,
      speakerQuality: state.value4,
      eventId: eventId,
      token: token,
      like: state.text1,
      dislike: state.text2,
    );
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
            'CHÚC MỪNG BẠN ĐÃ\nCHECK OUT THÀNH CÔNG!',
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
                    XCoordinator.replaceDashboard();

                    context.read<BottomNavigationBloc>().onItemTapped(0);
                  },
                  child: const Text(
                    "Quay lại trang chủ",
                  )),
            ),
          ],
        );
      },
    );
  }
}
