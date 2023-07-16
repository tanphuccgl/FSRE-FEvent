import 'package:fevent/src/feature/wallet/pages/wallet_page.dart';
import 'package:fevent/src/router/base_coordinator.dart';
import 'package:fevent/src/widgets/not_found_page.dart';
import 'package:flutter/material.dart';

class XWalletRouterName {
  static const String wallet = '/wallet';
}

class WalletCoordinator extends BaseCoordinator {
  @override
  String get initialRoute => XWalletRouterName.wallet;

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XWalletRouterName.wallet:
        return MaterialPageRoute(builder: (_) => const WalletPage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
