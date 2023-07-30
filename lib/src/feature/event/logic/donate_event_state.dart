// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "donate_event_bloc.dart";

class DonateEventState extends Equatable {
  final double number;
  final String note;

  const DonateEventState({
    this.number = 0.0,
    this.note = "",
  });
  @override
  List<Object?> get props => [
        number,
        note,
      ];

  DonateEventState copyWith({
    double? number,
    String? note,
  }) {
    return DonateEventState(
      number: number ?? this.number,
      note: note ?? this.note,
    );
  }
}
