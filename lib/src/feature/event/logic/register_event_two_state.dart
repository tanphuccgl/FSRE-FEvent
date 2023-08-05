// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "register_event_two_bloc.dart";

class RegisterEventTwoState extends Equatable {
  final EventModel? event;

  final String name;
  final String code;
  final String phone;
  final String email;
  final String note;

  const RegisterEventTwoState({
    this.event,
    this.name = "",
    this.code = "",
    this.phone = "",
    this.email = "",
    this.note = "",
  });
  @override
  List<Object?> get props => [
        event,
        name,
        code,
        phone,
        email,
        note,
      ];

  RegisterEventTwoState copyWith({
    EventModel? event,
    String? name,
    String? code,
    String? phone,
    String? email,
    String? note,
  }) {
    return RegisterEventTwoState(
      event: event ?? this.event,
      name: name ?? this.name,
      code: code ?? this.code,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      note: note ?? this.note,
    );
  }
}
