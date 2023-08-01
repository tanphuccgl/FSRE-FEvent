// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "update_profile_bloc.dart";

class UpdateProfileState extends Equatable {
  final UpdateProfileModel? updateProfile;
  final ProfileModel? profile;
  final String name;
  final String phone;
  final String major;
  final String course;
  final String birthDay;

  const UpdateProfileState({
    this.updateProfile,
    this.profile,
    this.name = "",
    this.phone = "",
    this.major = "",
    this.course = "",
    this.birthDay = "",
  });

  @override
  List<Object?> get props => [
        updateProfile,
        profile,
        name,
        phone,
        major,
        course,
        birthDay,
      ];

  UpdateProfileState copyWith({
    UpdateProfileModel? updateProfile,
    ProfileModel? profile,
    String? name,
    String? phone,
    String? major,
    String? course,
    String? birthDay,
  }) {
    return UpdateProfileState(
      updateProfile: updateProfile ?? this.updateProfile,
      profile: profile ?? this.profile,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      major: major ?? this.major,
      course: course ?? this.course,
      birthDay: birthDay ?? this.birthDay,
    );
  }
}
