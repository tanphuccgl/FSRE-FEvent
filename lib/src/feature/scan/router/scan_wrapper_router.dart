import 'package:fevent/src/feature/scan/router/scan_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanWrapperPage extends StatelessWidget {
  const ScanWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: (_) => context.read<ScanCoordinator>(),
      child: context.read<ScanCoordinator>().getNavigator(),
    );
  }
}
