import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/job_request_me.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "job_request_me_state.dart";

class JobRequestMeBloc extends Cubit<JobRequestMeState> {
  JobRequestMeBloc() : super(const JobRequestMeState()) {
    getJobRequestMeAccept();
    getJobRequestMePending();
  }

  Domain get _domain => GetIt.I<Domain>();

  void getJobRequestMeAccept() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result = await _domain.myEventRepository.getJobRequestMeAccept(token);
    if (result.isSuccess) {
      emit(state.copyWith(accept: result.data));
    }
  }

  void getJobRequestMePending() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result =
        await _domain.myEventRepository.getJobRequestMePending(token);
    if (result.isSuccess) {
      emit(state.copyWith(pending: result.data));
    }
  }
}
