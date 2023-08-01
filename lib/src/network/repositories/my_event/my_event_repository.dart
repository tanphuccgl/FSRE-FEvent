import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/interests_model.dart';
import 'package:fevent/src/network/model/participants_by_event_status_model.dart';
import 'package:fevent/src/network/model/participants_me_model.dart';

abstract class MyEventRepository {
  Future<XResult<ParticipantsMeModel>> getParticipantsMe(String token);
  Future<XResult<InterestsMeModel>> getInterestsMeModel(String token);

  Future<XResult<ParticipantsByEventStatusModel>>
      getParticipantsByEventStatusFinished(String token);

  Future<XResult<ParticipantsByEventStatusModel>>
      getParticipantsByEventStatusUpcomming(String token);
}
