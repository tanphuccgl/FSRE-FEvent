import 'package:fevent/src/network/model/check_participants.dart';
import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/donations.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/network/model/event_detail.dart';
import 'package:fevent/src/network/model/feedback.dart';
import 'package:fevent/src/network/model/post_participants.dart';
import 'package:fevent/src/network/model/remove_participants.dart';
import 'package:fevent/src/network/model/ticket.dart';

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

  Future<XResult<EventDetailModel>> getEvent(String eventId, String token);

  Future<XResult<CheckParticipantsModel>> checkRegisterEvent(
      String eventId, String token);

  Future<XResult<DonationsModel>> postDonateEvent({
    required double amount,
    required String token,
    required String note,
    required String eventId,
  });

  Future<XResult<TicketModel>> postTicketEvent(String eventId, String token);
  Future<XResult<FeedbackModel>> postFeedback({
    required int satisfaction,
    required int contentQuality,
    required int organization,
    required int speakerQuality,
    required String like,
    required String dislike,
    required String token,
    required String eventId,
  });
}
