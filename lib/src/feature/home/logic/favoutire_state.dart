// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "favoutire_bloc.dart";

class FavouriteState extends Equatable {
  final bool isEnable;

  const FavouriteState({this.isEnable = false});

  @override
  List<Object?> get props => [
        isEnable,
      ];

  FavouriteState copyWith({
    bool? isEnable,
  }) {
    return FavouriteState(
      isEnable: isEnable ?? this.isEnable,
    );
  }
}
