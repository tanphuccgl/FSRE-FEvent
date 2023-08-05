// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scan_bloc.dart';

class ScanState extends Equatable {
  final Barcode? barcode;
  const ScanState({this.barcode});

  @override
  List<Object?> get props => [
        barcode,
      ];

  ScanState copyWith({
    Barcode? barcode,
  }) {
    return ScanState(
      barcode: barcode ?? this.barcode,
    );
  }
}
