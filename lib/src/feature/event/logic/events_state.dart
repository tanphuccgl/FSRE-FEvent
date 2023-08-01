// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "events_bloc.dart";

class EventsState extends Equatable {
  final List<EventModel> list;
  final int count;

  String get countEvent =>
      list.map((e) => e.status == "ONGOING").length.toString();

  List<EventModel> get listUpcoming =>
      list.where((e) => e.status == "UPCOMING").toList();

  List<EventModel> get listOther =>
      list.where((e) => e.status != "UPCOMING").toList();

  const EventsState({
    this.list = const [],
    this.count = 0,
  });
  @override
  List<Object?> get props => [
        list,
        count,
      ];

  EventsState copyWith({
    List<EventModel>? list,
    int? count,
  }) {
    return EventsState(
      list: list ?? this.list,
      count: count ?? this.count,
    );
  }
}
