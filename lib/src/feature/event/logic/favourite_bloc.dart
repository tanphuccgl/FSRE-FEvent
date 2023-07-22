import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "favourite_state.dart";

class FavouriteBloc extends Cubit<FavouriteState> {
  FavouriteBloc() : super(FavouriteState());

  Domain get _domain => GetIt.I<Domain>();
}
