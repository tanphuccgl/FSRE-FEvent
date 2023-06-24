import 'package:equatable/equatable.dart';
import 'package:fevent/src/feature/home/router/home_wrapper_router.dart';
import 'package:fevent/src/feature/my_user/router/profile_wrapper_router.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/widgets/not_found_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Cubit<BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationState());

  void onItemTapped(int index) =>
      _emitIfOpen(state.copyWith(pageIndex: PageIndex.values[index]));
  void _emitIfOpen(BottomNavigationState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
