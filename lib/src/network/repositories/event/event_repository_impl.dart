import 'package:dio/dio.dart';
import 'package:fevent/src/config/constants/endpoints.dart';
import 'package:fevent/src/network/data_sources/base_data_source.dart';
import 'package:fevent/src/network/model/check_participants.dart';
import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/donations.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/network/model/event/list_event_model.dart';
import 'package:fevent/src/network/model/event_detail.dart';
import 'package:fevent/src/network/model/feedback.dart';
import 'package:fevent/src/network/model/post_participants.dart';
import 'package:fevent/src/network/model/remove_participants.dart';
import 'package:fevent/src/network/model/ticket.dart';
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
        "${Endpoints.event}?page=0&pageSize=99&orderBy=startDate&order=ASC&isShowInactive=false&startDate=12%3A00%2001%2F01%2F2000&endDate=12%3A00%2001%2F01%2F2099",
      );

      final result = ListEventModel.fromJson(
        response.data,
      );
      final list = (result.data ?? []).toList();
      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(list)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET LIST Event CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<PostParticipantsModel>> postRegisterEvent(
      String eventId, String token) async {
    try {
      final response = await BaseDataSource().post(
        Endpoints.postRegisterEvent,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
        data: {
          "eventId": eventId,
        },
      );

      final result = PostParticipantsModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e, a) {
      LoggerHelper.error('> postFavouriteEvent CATCH Error< $e $a');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<RemoveParticipantsModel>> removeRegisterEvent(
      String participantId, String token) async {
    try {
      final response = await BaseDataSource().delete(
        "${Endpoints.deleteRegisterEvent}/$participantId",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = RemoveParticipantsModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e, a) {
      LoggerHelper.error('> deleta removeRegisterEvent CATCH Error< $e $a');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<EventDetailModel>> getEvent(
      String eventId, String token) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getEvent}/$eventId",
      );

      final result = EventDetailModel.fromJson(
        response.data,
      );

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET  Event CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<CheckParticipantsModel>> checkRegisterEvent(
      String eventId, String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.checkRegisterEvent(eventId),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = CheckParticipantsModel.fromJson(response.data);
      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e, a) {
      LoggerHelper.error('> GET checkRegisterEvent CATCH Error< $e $a');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<DonationsModel>> postDonateEvent({
    required double amount,
    required String token,
    required String note,
    required String eventId,
  }) async {
    try {
      final response = await BaseDataSource().post(
        Endpoints.postdonations,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
        data: {
          "amount": amount,
          "note": note,
          "eventId": eventId,
        },
      );

      final result = DonationsModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? result.message == "Quyên góp thành công"
              ? XResult.success(result)
              : XResult.error("payment")
          : XResult.error(result.message);
    } catch (e, a) {
      LoggerHelper.error('> postDonateEvent CATCH Error< $e $a');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<TicketModel>> postTicketEvent(
      String eventId, String token) async {
    try {
      final response = await BaseDataSource().post(
        Endpoints.postRegisterEvent,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
        data: {
          "eventId": eventId,
        },
      );

      final result = TicketModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e, a) {
      LoggerHelper.error('> postTicketEvent CATCH Error< $e $a');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<FeedbackModel>> postFeedback({
    required int satisfaction,
    required int contentQuality,
    required int organization,
    required int speakerQuality,
    required String like,
    required String dislike,
    required String token,
    required String eventId,
  }) async {
    try {
      final response = await BaseDataSource().post(Endpoints.postdonations,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
          data: {
            "satisfaction": satisfaction,
            "contentQuality": contentQuality,
            "organization": organization,
            "speakerQuality": speakerQuality,
            "like": like,
            "dislike": dislike,
            "eventId": eventId,
          });

      final result = FeedbackModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e, a) {
      LoggerHelper.error('> postFeedback CATCH Error< $e $a');

      return XResult.exception(e);
    }
  }
}
