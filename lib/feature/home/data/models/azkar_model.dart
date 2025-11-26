import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'azkar_model.g.dart';

@HiveType(typeId: 0)
class AzkarModel extends Equatable {
  @HiveField(0)
  final String dhikr;
  @HiveField(1)
  final int repetitionCount;
  @HiveField(2)
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
