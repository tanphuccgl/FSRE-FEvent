import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/event/event_model.dart';

abstract class EventRepository {
  Future<XResult<List<EventModel>>> getListEvent({
    required int page,
    required int pageSize,
    required String orderBy,
    required String order,
    required bool isShowInactive,
    required String startDate,
    required String endDate,
  });
}
