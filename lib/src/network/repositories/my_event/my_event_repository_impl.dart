import 'package:dio/dio.dart';
import 'package:fevent/src/config/constants/endpoints.dart';
import 'package:fevent/src/network/data_sources/base_data_source.dart';
import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/interests_model.dart';
import 'package:fevent/src/network/model/job_request_me.dart';
import 'package:fevent/src/network/model/my_donation.dart';
import 'package:fevent/src/network/model/participants_by_event_status_model.dart';
import 'package:fevent/src/network/model/participants_me_model.dart';
import 'package:fevent/src/network/repositories/my_event/my_event_repository.dart';
import 'package:fevent/src/utils/helper/logger.dart';

class MyEventRepositoryImpl extends MyEventRepository {
  @override
  Future<XResult<InterestsMeModel>> getInterestsMeModel(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getInterestsMe,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = InterestsMeModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET getInterestsMeModel  CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<ParticipantsByEventStatusModel>>
      getParticipantsByEventStatusFinished(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getParticipantsByEventStatusFinished,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = ParticipantsByEventStatusModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET getParticipantsByEventStatus  CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<ParticipantsByEventStatusModel>>
      getParticipantsByEventStatusUpcomming(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getParticipantsByEventStatusUpcomming,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = ParticipantsByEventStatusModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET getParticipantsByEventStatus  CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<ParticipantsMeModel>> getParticipantsMe(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getparticipantsMe,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = ParticipantsMeModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET getParticipantsMe  CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<JobRequestMeModel>> getJobRequestMeAccept(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getJobRequestMeAccept,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = JobRequestMeModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET getJobRequestMeAccept  CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<JobRequestMeModel>> getJobRequestMePending(
      String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getJobRequestMePending,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = JobRequestMeModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET getJobRequestMePending  CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<MyDonationModel>> getMyDonation(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.myDonation,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = MyDonationModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET getMyDonation  CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}
