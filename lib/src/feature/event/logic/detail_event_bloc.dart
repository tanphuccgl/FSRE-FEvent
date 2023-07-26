import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/check_participants.dart';
import 'package:fevent/src/network/model/job.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "detail_event_state.dart";

class DetailEventBloc extends Cubit<DetailEventState> {
  final String eventId;
  DetailEventBloc(this.eventId) : super(const DetailEventState()) {
    initial();
  }

  Domain get _domain => GetIt.I<Domain>();

  void initial() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    final result =
        await _domain.eventRepository.checkRegisterEvent(eventId, token);
    if (result.isSuccess) {
      emit(state.copyWith(data: result.data));
    }
  }
}
