// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "detail_event_bloc.dart";

class DetailEventState extends Equatable {
  final CheckParticipantsModel? data;
  final EventDetailModel? eventModel;

  const DetailEventState({
    this.data,
    this.eventModel,
  });

  @override
  List<Object?> get props => [
        data,
        eventModel,
      ];

  DetailEventState copyWith({
    CheckParticipantsModel? data,
    EventDetailModel? eventModel,
  }) {
    return DetailEventState(
      data: data ?? this.data,
      eventModel: eventModel ?? this.eventModel,
    );
  }
}
