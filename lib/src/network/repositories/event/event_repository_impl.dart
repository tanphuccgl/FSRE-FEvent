import 'package:fevent/src/config/constants/endpoints.dart';
import 'package:fevent/src/network/data_sources/base_data_source.dart';
import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/network/model/event/list_event_model.dart';
import 'package:fevent/src/network/repositories/event/event_repository.dart';
import 'package:fevent/src/utils/helper/logger.dart';

class EventRepositoryImpl extends EventRepository {
  @override
  Future<XResult<List<EventModel>>> getListEvent({
    required int page,
    required int pageSize,
    required String orderBy,
    required String order,
    required bool isShowInactive,
    required String startDate,
    required String endDate,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.event}?page=0&pageSize=12&orderBy=createdAt&order=ASC&isShowInactive=false&startDate=12%3A00%2001%2F01%2F2000&endDate=12%3A00%2001%2F01%2F2099",
      );

      final result = ListEventModel.fromJson(
        response.data,
      );
      final list = (result.data ?? []).toList();
      return response.statusCode == 200
          ? XResult.success(list)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET LIST Event CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}
