// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "donate_event_bloc.dart";

class DonateEventState extends Equatable {
  final double number;
  final String note;
  final EventDetailModel? eventModel;

  const DonateEventState({
    this.number = 0.0,
    this.note = "",
    this.eventModel,
  });
  @override
  List<Object?> get props => [
        number,
        note,
        eventModel,
      ];

  DonateEventState copyWith({
    double? number,
    String? note,
    EventDetailModel? eventModel,
  }) {
    return DonateEventState(
      number: number ?? this.number,
      note: note ?? this.note,
      eventModel: eventModel ?? this.eventModel,
    );
  }
}
