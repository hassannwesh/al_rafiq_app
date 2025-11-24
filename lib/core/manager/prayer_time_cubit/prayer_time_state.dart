import 'package:adhan/adhan.dart';
import 'package:equatable/equatable.dart';

class PrayerTimeState extends Equatable {
  final PrayerTimes? prayerTimes;
  final Prayer? nextPrayer;
  final Duration? timeRemaining;
  final bool isLoading;
  final String? errorMessage;

  const PrayerTimeState({
    this.prayerTimes,
    this.nextPrayer,
    this.timeRemaining,
    this.isLoading = false,
    this.errorMessage,
  });

  factory PrayerTimeState.initial() {
    return const PrayerTimeState(isLoading: true);
  }

  PrayerTimeState copyWith({
    PrayerTimes? prayerTimes,
    Prayer? nextPrayer,
    Duration? timeRemaining,
    bool? isLoading,
    String? errorMessage,
  }) {
    return PrayerTimeState(
      prayerTimes: prayerTimes ?? this.prayerTimes,
      nextPrayer: nextPrayer ?? this.nextPrayer,
      timeRemaining: timeRemaining ?? this.timeRemaining,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    prayerTimes,
    nextPrayer,
    timeRemaining,
    isLoading,
    errorMessage,
  ];
}
