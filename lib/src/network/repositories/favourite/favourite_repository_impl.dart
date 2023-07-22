import 'package:fevent/src/config/constants/endpoints.dart';
import 'package:fevent/src/network/data_sources/base_data_source.dart';
import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/network/model/event/list_event_model.dart';
import 'package:fevent/src/network/model/favourite.dart';
import 'package:fevent/src/network/repositories/event/event_repository.dart';
import 'package:fevent/src/network/repositories/favourite/favourite_repository.dart';
import 'package:fevent/src/utils/helper/logger.dart';

class FavouriteRepositoryImpl extends FavouriteRepository {
  @override
  Future<XResult<bool>> getFavouriteEvent(String eventId) async {
    try {
      final response =
          await BaseDataSource().get("${Endpoints.getFavouriteEvent}/$eventId");
  //TODO
      //  final result = FavouriteModel.fromJson(response.data);
      //   final list = (result.data ?? []).toList();

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(true)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> getFavouriteEvent CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}
