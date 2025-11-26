import 'package:al_rafiq/feature/home/data/models/azkar_model.dart';
import 'package:al_rafiq/feature/home/data/repos/azkar_repo.dart';
import 'package:al_rafiq/feature/home/presentation/manager/azkar_cubit/azkar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit(this.azkarRepo) : super(AzkarInitial());

  final AzkarRepo azkarRepo;

  Future<void> fetchAzkar(String category) async {
    emit(AzkarLoading());
    try {
      final azkar = await azkarRepo.getAzkar(category);
      emit(AzkarSuccess(azkar));
    } catch (e) {
      emit(AzkarFailure(e.toString()));
    }
  }

  Future<void> addAzkar(String category, AzkarModel azkar) async {
    try {
      await azkarRepo.addAzkar(category, azkar);
      await fetchAzkar(category);
    } catch (e) {
      emit(AzkarFailure(e.toString()));
    }
  }

  Future<void> deleteAzkar(String category, int index) async {
    try {
      await azkarRepo.deleteAzkar(category, index);
      await fetchAzkar(category);
    } catch (e) {
      emit(AzkarFailure(e.toString()));
    }
  }

  Future<void> updateAzkar(String category, int index, AzkarModel azkar) async {
    try {
      await azkarRepo.updateAzkar(category, index, azkar);
      await fetchAzkar(category);
    } catch (e) {
      emit(AzkarFailure(e.toString()));
    }
  }
}
