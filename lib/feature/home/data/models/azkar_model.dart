import 'package:equatable/equatable.dart';

class AzkarModel extends Equatable {
  final String dhikr;
  final int repetitionCount;
  final String virtue;

  const AzkarModel({
    required this.dhikr,
    required this.repetitionCount,
    required this.virtue,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      dhikr: json['dhikr'] as String,
      repetitionCount: json['repetitionCount'] as int,
      virtue: json['virtue'] as String,
    );
  }

  @override
  List<Object?> get props => [dhikr, repetitionCount, virtue];
}
