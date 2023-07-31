import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';

import 'package:fevent/src/network/model/interests_model.dart';
import 'package:fevent/src/network/model/participants_by_event_status_model.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/widgets/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'my_events_state.dart';

class MyEventsBloc extends Cubit<MyEventsState> {
  MyEventsBloc() : super(const MyEventsState()) {
    getInterestsMeModel();
    getParticipantsByEventStatusFinished();
    getParticipantsByEventStatusUpcomming();
  }

  Domain get _domain => GetIt.I<Domain>();

  Future<void> getInterestsMeModel() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final value = await _domain.myEventRepository.getInterestsMeModel(token);
    if (value.isSuccess) {
      emit(state.copyWith(interestsMeModel: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }

  Future<void> getParticipantsByEventStatusFinished() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final value = await _domain.myEventRepository
        .getParticipantsByEventStatusFinished(token);
    if (value.isSuccess) {
      emit(state.copyWith(participantsByEventStatusFinished: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }

  Future<void> getParticipantsByEventStatusUpcomming() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final value = await _domain.myEventRepository
        .getParticipantsByEventStatusUpcomming(token);
    if (value.isSuccess) {
      emit(state.copyWith(participantsByEventStatusUpcomming: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }
}
