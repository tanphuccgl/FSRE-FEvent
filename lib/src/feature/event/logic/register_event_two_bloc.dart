import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/helper/radius.dart';

part "register_event_two_state.dart";

class RegisterEventTwoBloc extends Cubit<RegisterEventTwoState> {
  RegisterEventTwoBloc() : super(RegisterEventTwoState());

  void onRegisterButton(BuildContext context) {
    showDialog(
      context: context,
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
                  onPressed: () => Navigator.of(context).pop(),
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
