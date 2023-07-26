import 'package:fevent/src/network/model/check_participants.dart';
import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/network/model/post_participants.dart';
import 'package:fevent/src/network/model/remove_participants.dart';

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

  Future<XResult<PostParticipantsModel>> postRegisterEvent(
      String eventId, String token);

  Future<XResult<RemoveParticipantsModel>> removeRegisterEvent(
      String participantId, String token);

  Future<XResult<EventModel>> getEvent(String eventId, String token);

  Future<XResult<CheckParticipantsModel>> checkRegisterEvent(
      String eventId, String token);
}
