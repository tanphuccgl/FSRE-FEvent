// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "job_bloc.dart";

class JobState extends Equatable {
  final JobsModel? data;

  const JobState({this.data});

  @override
  List<Object?> get props => [
        data,
      ];

  JobState copyWith({
    JobsModel? data,
  }) {
    return JobState(
      data: data ?? this.data,
    );
  }
}
