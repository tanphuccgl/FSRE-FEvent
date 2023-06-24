import 'package:fevent/src/feature/my_user/router/profile_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyUserWrapperPage extends StatelessWidget {
  const MyUserWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: (_) => context.read<MyUserCoordinator>(),
      child: context.read<MyUserCoordinator>().getNavigator(),
    );
  }
}
