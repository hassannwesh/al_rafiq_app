import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:al_rafiq/core/manager/prayer_time_cubit/prayer_time_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeState.initial()) {
    getPrayerTimes();
  }

  Timer? _timer;

  Future<void> getPrayerTimes() async {
    emit(state.copyWith(isLoading: true));
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(
          state.copyWith(
            errorMessage: 'Location services are disabled.',
            isLoading: false,
          ),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(
            state.copyWith(
              errorMessage: 'Location permissions are denied',
              isLoading: false,
            ),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            errorMessage: 'Location permissions are permanently denied',
            isLoading: false,
          ),
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition();
      final myCoordinates = Coordinates(position.latitude, position.longitude);
      final params = CalculationMethod.muslim_world_league.getParameters();
      params.madhab = Madhab.shafi;

      final prayerTimes = PrayerTimes.today(myCoordinates, params);

      emit(state.copyWith(prayerTimes: prayerTimes, isLoading: false));
      _startTimer();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final prayerTimes = state.prayerTimes;
      if (prayerTimes == null) return;

      final next = prayerTimes.nextPrayer();
      final nextTime = prayerTimes.timeForPrayer(next);

      if (nextTime != null) {
        final now = DateTime.now();
        final remaining = nextTime.difference(now);

        if (remaining.isNegative) {
          // Refresh prayer times if next prayer passed
          getPrayerTimes();
        } else {
          emit(state.copyWith(nextPrayer: next, timeRemaining: remaining));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
