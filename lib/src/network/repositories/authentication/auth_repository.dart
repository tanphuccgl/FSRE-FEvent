import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/profile.dart';
import 'package:fevent/src/network/model/update_profile.dart';
import 'package:fevent/src/network/model/user.dart';

abstract class AuthRepository {
  Future<XResult<UserModel>> loginGoogle({
    required String name,
    required String email,
    required String uuidGoogle,
  });

  Future<XResult<ProfileModel>> getProfile(String token);

  Future<XResult<UpdateProfileModel>> updateProfile({
    required String token,
    required String name,
    required String phone,
    required String major,
    required String semester,
    required String dateOfBirth,
  });

  Future<XResult<bool>> logout();
}
