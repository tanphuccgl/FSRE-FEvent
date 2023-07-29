// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final ProfileModel? profile;
  const ProfileState({this.profile});

  @override
  List<Object?> get props => [
        profile,
      ];

  ProfileState copyWith({
    ProfileModel? profile,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
    );
  }
}
