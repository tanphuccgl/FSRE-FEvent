// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "register_event_one_bloc.dart";

class RegisterEventOneState extends Equatable {
  final String name;
  final String code;
  final String phone;
  final String email;
  final String note;

  const RegisterEventOneState({
    this.name = "",
    this.code = "",
    this.phone = "",
    this.email = "",
    this.note = "",
  });
  @override
  List<Object?> get props => [
        name,
        code,
        phone,
        email,
        note,
      ];

  RegisterEventOneState copyWith({
    String? name,
    String? code,
    String? phone,
    String? email,
    String? note,
  }) {
    return RegisterEventOneState(
      name: name ?? this.name,
      code: code ?? this.code,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      note: note ?? this.note,
    );
  }
}
