// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "events_bloc.dart";

class EventsState extends Equatable {
  final List<EventModel> list;

  const EventsState({this.list = const []});
  @override
  List<Object?> get props => [
        list,
      ];

  EventsState copyWith({
    List<EventModel>? list,
  }) {
    return EventsState(
      list: list ?? this.list,
    );
  }
}