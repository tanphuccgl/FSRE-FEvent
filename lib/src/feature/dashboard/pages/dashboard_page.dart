import 'package:fevent/src/feature/float_bottom_navigation/cubit/bottom_navigation_bloc.dart';
import 'package:fevent/src/feature/float_bottom_navigation/pages/float_bottom_navigation.dart';
import 'package:fevent/src/feature/home/router/home_router.dart';
import 'package:fevent/src/feature/my_user/router/profile_router.dart';
import 'package:fevent/src/feature/wallet/router/wallet_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../scan/router/scan_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => HomeCoordinator()),
        RepositoryProvider(create: (_) => MyUserCoordinator()),
        RepositoryProvider(create: (_) => WalletCoordinator()),
        RepositoryProvider(create: (_) => ScanCoordinator()),
      ],
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (_, state) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Stack(children: [
              Scaffold(
                body: state.pageIndex.page,
                bottomNavigationBar: const FloatBottomNavigation(),
              ),
            ]),
          );
        },
        buildWhen: (p, c) => p.pageIndex != c.pageIndex,
      ),
    );
  }
}
