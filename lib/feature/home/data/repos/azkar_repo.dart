import 'package:al_rafiq/feature/home/data/models/azkar_model.dart';

abstract class AzkarRepo {
  Future<List<AzkarModel>> getAzkar(String category);
}
