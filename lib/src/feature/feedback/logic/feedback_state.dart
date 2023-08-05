// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "feedback_bloc.dart";

class FeedbackState extends Equatable {
  final int value1;
  final int value2;
  final int value3;
  final int value4;
  final String text1;
  final String text2;

  const FeedbackState({
    this.value1 = 1,
    this.value2 = 1,
    this.value3 = 1,
    this.value4 = 1,
    this.text1 = "",
    this.text2 = "",
  });

  @override
  List<Object?> get props => [
        value1,
        value2,
        value3,
        value4,
        text1,
        text2,
      ];

  FeedbackState copyWith({
    int? value1,
    int? value2,
    int? value3,
    int? value4,
    String? text1,
    String? text2,
  }) {
    return FeedbackState(
      value1: value1 ?? this.value1,
      value2: value2 ?? this.value2,
      value3: value3 ?? this.value3,
      value4: value4 ?? this.value4,
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
    );
  }
}
