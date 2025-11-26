import 'dart:convert';
import 'package:al_rafiq/feature/home/data/models/azkar_model.dart';
import 'package:al_rafiq/feature/home/data/repos/azkar_repo.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AzkarRepoImpl implements AzkarRepo {
  @override
  Future<List<AzkarModel>> getAzkar(String category) async {
    try {
      var box = await Hive.openBox<AzkarModel>(category);

      if (box.isEmpty) {
        final String response = await rootBundle.loadString(
          'assets/data/$category.json',
        );
        final List<dynamic> data = json.decode(response);
        final List<AzkarModel> azkarList = data
            .map((json) => AzkarModel.fromJson(json))
            .toList();

        await box.addAll(azkarList);
        return azkarList;
      } else {
        return box.values.toList();
      }
    } catch (e) {
      throw Exception('Failed to load Azkar: $e');
    }
  }

  @override
  Future<void> addAzkar(String category, AzkarModel azkar) async {
    var box = await Hive.openBox<AzkarModel>(category);
    await box.add(azkar);
  }

  @override
  Future<void> deleteAzkar(String category, int index) async {
    var box = await Hive.openBox<AzkarModel>(category);
    await box.deleteAt(index);
  }

  @override
  Future<void> updateAzkar(String category, int index, AzkarModel azkar) async {
    var box = await Hive.openBox<AzkarModel>(category);
    await box.putAt(index, azkar);
  }
}
