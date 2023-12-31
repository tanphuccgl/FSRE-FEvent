import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class XLoadingAlert extends StatelessWidget {
  const XLoadingAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const _Indicator(),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator();

  @override
  Widget build(BuildContext context) {
    const double radius = 15;
    if (kIsWeb || Platform.isAndroid) {
      return const SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      );
    }

    return const CupertinoActivityIndicator(
      radius: radius,
    );
  }
}
