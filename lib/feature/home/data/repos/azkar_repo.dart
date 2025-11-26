import 'package:al_rafiq/feature/home/data/models/azkar_model.dart';

abstract class AzkarRepo {
  Future<List<AzkarModel>> getAzkar(String category);
  Future<void> addAzkar(String category, AzkarModel azkar);
  Future<void> deleteAzkar(String category, int index);
  Future<void> updateAzkar(String category, int index, AzkarModel azkar);
}
