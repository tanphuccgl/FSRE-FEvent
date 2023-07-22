import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/user.dart';

abstract class AuthRepository {
  Future<XResult<UserModel>> loginGoogle({
    required String name,
    required String email,
    required String uuidGoogle,
  });

  Future<XResult<bool>> logout();
}
