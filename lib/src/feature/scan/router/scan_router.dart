import 'package:fevent/src/feature/scan/pages/scan_page.dart';

import 'package:fevent/src/router/base_coordinator.dart';
import 'package:fevent/src/widgets/not_found_page.dart';
import 'package:flutter/material.dart';

class XScanRouterName {
  static const String wallet = '/scan';
}

class ScanCoordinator extends BaseCoordinator {
  @override
  String get initialRoute => XScanRouterName.wallet;

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XScanRouterName.wallet:
        return MaterialPageRoute(builder: (_) => const ScanPage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
