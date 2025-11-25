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
}
