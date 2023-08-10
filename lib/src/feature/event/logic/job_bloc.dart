import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/job.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "job_state.dart";

class JobBloc extends Cubit<JobState> {
  final String eventId;
  JobBloc(this.eventId) : super(const JobState()) {
    initial();
  }

  Domain get _domain => GetIt.I<Domain>();

  void initial() async {
    final result = await _domain.jobRepository.getListJob(eventId);
    if (result.isSuccess) {
      emit(state.copyWith(data: result.data));
    }
  }
}
