import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/services/auth_service.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/widgets/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "login_state.dart";

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(LoginState());

  Domain get _domain => GetIt.I<Domain>();

  void onTapLogin() async {
    final user = await Authentication.signInWithGoogle();
    if (user == null) {
      XToast.error("Lỗi");
    }
    final result = await _domain.authRepository.loginGoogle(
      name: user!.displayName ?? "",
      email: user.email ?? "",
      uuidGoogle: user.uid,
    );

    if (result.isSuccess) {
      UserPrefs().saveUser(result.data);
      XCoordinator.showDashboard();
    } else {
      XToast.error("Lỗi");
    }
  }
}
