// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:fevent/src/feature/float_bottom_navigation/cubit/bottom_navigation_bloc.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/utils/helper/radius.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../widgets/toast_wrapper.dart';

part 'scan_state.dart';

class ScanBloc extends Cubit<ScanState> {
  ScanBloc() : super(const ScanState()) {
    _getCameraPermission();
  }

  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }

  void onQRViewCreated(QRViewController controllerValue) {
    controller = controllerValue;
    scannedStream();
  }

  void scannedStream() {
    if (controller == null) return;
    controller!.scannedDataStream.listen((scanData) {
      _emitIfOpen(state.copyWith(barcode: scanData));
    });
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
            'CHÚC MỪNG BẠN ĐÃ\nĐIỂM DANH THÀNH CÔNG!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
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

                    context.read<BottomNavigationBloc>().onItemTapped(1);
                  },
                  child: const Text(
                    "Quay Lại trang chủ",
                  )),
            ),
          ],
        );
      },
    );
  }

  void onPermissionSet(
    // BuildContext context,
    // QRViewController ctrl,
    bool p,
  ) {
    if (kDebugMode) {
      print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    }
    if (!p) {
      XToast.show('Không có quyền');
    }
  }

  @override
  Future<void> close() {
    controller?.dispose();

    return super.close();
  }

  void _emitIfOpen(ScanState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
