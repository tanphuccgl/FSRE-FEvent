// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "detail_event_bloc.dart";

class DetailEventState extends Equatable {
  final CheckParticipantsModel? data;

  const DetailEventState({this.data});

  @override
  List<Object?> get props => [
        data,
      ];

  DetailEventState copyWith({
    CheckParticipantsModel? data,
  }) {
    return DetailEventState(
      data: data ?? this.data,
    );
  }
}
