import 'dart:convert';
import 'package:al_rafiq/feature/home/data/models/azkar_model.dart';
import 'package:al_rafiq/feature/home/data/repos/azkar_repo.dart';
import 'package:flutter/services.dart';

class AzkarRepoImpl implements AzkarRepo {
  @override
  Future<List<AzkarModel>> getAzkar(String category) async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/$category.json',
      );
      final List<dynamic> data = json.decode(response);
      return data.map((json) => AzkarModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load Azkar: $e');
    }
  }
}
