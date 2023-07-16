import 'package:fevent/src/feature/wallet/router/wallet_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletWrapperPage extends StatelessWidget {
  const WalletWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: (_) => context.read<WalletCoordinator>(),
      child: context.read<WalletCoordinator>().getNavigator(),
    );
  }
}
