import 'package:fevent/src/feature/scan/logic/scan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScanBloc(),
      child: BlocBuilder<ScanBloc, ScanState>(
        builder: (context, _) {
          final bloc = context.read<ScanBloc>();
          return Scaffold(
            body: QRView(
              key: bloc.qrKey,
              onQRViewCreated: (p0) => bloc.onQRViewCreated(p0),
              overlay: QrScannerOverlayShape(
                borderColor: Colors.grey,
                borderWidth: 12,
                borderRadius: 5,
                borderLength: 20,
                cutOutSize: 250.0.w,
              ),
              onPermissionSet: (ctrl, p) => bloc.onPermissionSet(
                // context,
                // ctrl,
                p,
              ),
            ),
          );
        },
      ),
    );
  }
}
