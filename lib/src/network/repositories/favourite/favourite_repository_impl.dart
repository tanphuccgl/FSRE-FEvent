import 'package:dio/dio.dart';
import 'package:fevent/src/config/constants/endpoints.dart';
import 'package:fevent/src/network/data_sources/base_data_source.dart';
import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/favourite.dart';
import 'package:fevent/src/network/model/post_favourite.dart';
import 'package:fevent/src/network/repositories/favourite/favourite_repository.dart';
import 'package:fevent/src/utils/helper/logger.dart';

class FavouriteRepositoryImpl extends FavouriteRepository {
  @override
  Future<XResult<FavouriteModel>> getFavouriteEvent(String eventId) async {
    try {
      final response =
          await BaseDataSource().get("${Endpoints.getFavouriteEvent}/$eventId");

      final result = FavouriteModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> getFavouriteEvent CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<PostFavouriteModel>> postFavouriteEvent(
      String eventId, String token) async {
    try {
      final response = await BaseDataSource().post(
        Endpoints.postFavouriteEvent,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
        data: {
          "eventId": eventId,
        },
      );

      final result = PostFavouriteModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e, a) {
      LoggerHelper.error('> postFavouriteEvent CATCH Error< $e $a');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<bool>> removeFavouriteEvent(
      String eventId, String token) async {
    try {
      final response = await BaseDataSource().delete(
        "${Endpoints.removeFavouriteEvent}/$eventId",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(true)
          : XResult.error("Error");
    } catch (e, a) {
      LoggerHelper.error('> removeFavouriteEvent CATCH Error< $e $a');

      return XResult.exception(e);
    }
  }
}
