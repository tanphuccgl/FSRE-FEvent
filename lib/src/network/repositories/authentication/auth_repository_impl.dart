import 'package:fevent/src/config/constants/endpoints.dart';
import 'package:fevent/src/network/data_sources/base_data_source.dart';
import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/user.dart';
import 'package:fevent/src/network/repositories/authentication/auth_repository.dart';
import 'package:fevent/src/utils/helper/logger.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<XResult<UserModel>> loginGoogle({
    required String name,
    required String email,
    required String uuidGoogle,
  }) async {
    try {
      final response = await BaseDataSource().post(
        Endpoints.google,
        data: {
          "name": name,
          "email": email,
          "sub": uuidGoogle,
        },
      );

      final result = UserModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> login with google A CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<bool>> logout() async {
    try {
      final response = await BaseDataSource().post(Endpoints.logout);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(true)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> logout A CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}
