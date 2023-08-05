// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "job_request_me_bloc.dart";

class JobRequestMeState extends Equatable {
  final JobRequestMeModel? pending;
  final JobRequestMeModel? accept;

  const JobRequestMeState({
    this.pending,
    this.accept,
  });
  @override
  List<Object?> get props => [pending, accept];

  JobRequestMeState copyWith({
    JobRequestMeModel? pending,
    JobRequestMeModel? accept,
  }) {
    return JobRequestMeState(
      pending: pending ?? this.pending,
      accept: accept ?? this.accept,
    );
  }
}
