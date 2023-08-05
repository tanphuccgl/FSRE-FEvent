// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'donation_me_bloc.dart';

class MyDonationState extends Equatable {
  final MyDonationModel? donationModel;

  String get total {
    int result = 0;
    final listAmount =
        (donationModel?.data ?? []).map((e) => e.amount).toList();
    for (var element in listAmount) {
      result = result + (element ?? 0);
    }
    return result.toString();
  }

  const MyDonationState({
    this.donationModel,
  });
  @override
  List<Object?> get props => [
        donationModel,
      ];

  MyDonationState copyWith({
    MyDonationModel? donationModel,
  }) {
    return MyDonationState(
      donationModel: donationModel ?? this.donationModel,
    );
  }
}
