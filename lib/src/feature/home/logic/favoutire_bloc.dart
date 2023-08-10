import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "favoutire_state.dart";

class FavouriteBloc extends Cubit<FavouriteState> {
  final String eventId;
  FavouriteBloc(this.eventId) : super(const FavouriteState()) {
    init();
  }

  Domain get _domain => GetIt.I<Domain>();

  void init() async {
    final result = await _domain.favouriteRepository.getFavouriteEvent(eventId);
    if (result.isSuccess) {
      if ((result.data!.listInterest ?? []).isNotEmpty) {
        _emitIfOpen(state.copyWith(isEnable: true));
      } else {
        _emitIfOpen(state.copyWith(isEnable: false));
      }
    }
  }

  void postFavouriteEvent() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    final result = await _domain.favouriteRepository.postFavouriteEvent(
      eventId,
      token,
    );
    if (result.isSuccess) {
      init();
    }
  }

  void removeFavouriteEvent() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    final result = await _domain.favouriteRepository.removeFavouriteEvent(
      eventId,
      token,
    );
    if (result.isSuccess) {
      init();
    }
  }

  void _emitIfOpen(FavouriteState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
