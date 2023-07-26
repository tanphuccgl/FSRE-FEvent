// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "register_event_two_bloc.dart";

class RegisterEventTwoState extends Equatable {
  final EventModel? event;

  const RegisterEventTwoState({this.event});
  @override
  List<Object?> get props => [
        event,
      ];

  RegisterEventTwoState copyWith({
    EventModel? event,
  }) {
    return RegisterEventTwoState(
      event: event ?? this.event,
    );
  }
}
