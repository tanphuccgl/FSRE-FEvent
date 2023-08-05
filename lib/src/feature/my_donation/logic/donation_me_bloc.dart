import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/my_donation.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'donation_me_state.dart';

class MyDonationBloc extends Cubit<MyDonationState> {
  MyDonationBloc() : super(const MyDonationState()) {
    getMyDonation();
  }

  Domain get _domain => GetIt.I<Domain>();

  void getMyDonation() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result = await _domain.myEventRepository.getMyDonation(token);
    if (result.isSuccess) {
      emit(state.copyWith(donationModel: result.data));
    }
  }
}
