import 'package:equatable/equatable.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "login_state.dart";

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(LoginState());

  void onTapLogin() {
    XCoordinator.showDashboard();
  }
}
