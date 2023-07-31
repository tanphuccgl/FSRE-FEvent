// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_events_bloc.dart';

class MyEventsState extends Equatable {
  final InterestsMeModel? interestsMeModel;
  final ParticipantsByEventStatusModel? participantsByEventStatusFinished;
  final ParticipantsByEventStatusModel? participantsByEventStatusUpcomming;

  const MyEventsState({
    this.interestsMeModel,
    this.participantsByEventStatusFinished,
    this.participantsByEventStatusUpcomming,
  });
  @override
  List<Object?> get props => [
        interestsMeModel,
        participantsByEventStatusFinished,
        participantsByEventStatusUpcomming,
      ];

  MyEventsState copyWith({
    InterestsMeModel? interestsMeModel,
    ParticipantsByEventStatusModel? participantsByEventStatusFinished,
    ParticipantsByEventStatusModel? participantsByEventStatusUpcomming,
  }) {
    return MyEventsState(
      interestsMeModel: interestsMeModel ?? this.interestsMeModel,
      participantsByEventStatusFinished: participantsByEventStatusFinished ??
          this.participantsByEventStatusFinished,
      participantsByEventStatusUpcomming: participantsByEventStatusUpcomming ??
          this.participantsByEventStatusUpcomming,
    );
  }
}
