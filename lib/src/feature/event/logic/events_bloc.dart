import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/widgets/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "events_state.dart";

class EventsBloc extends Cubit<EventsState> {
  EventsBloc() : super(const EventsState()) {
    getListDepartment();
  }

  Domain get _domain => GetIt.I<Domain>();

  Future<void> getListDepartment() async {
    final value = await _domain.eventRepository.getListEvent(
      endDate: "",
      isShowInactive: false,
      orderBy: "",
      order: "",
      page: 0,
      pageSize: 0,
      startDate: "",
    );
    if (value.isSuccess) {
      emit(state.copyWith(list: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }
}
