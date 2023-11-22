import 'package:auction/data/model/character_summary_models.dart';
import 'package:auction/data/provider/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CharacterRepository {
  final ApiClient apiClient;
  final String key;
  CharacterRepository({required this.apiClient}) : key = dotenv.env["apiKey"]!;

  Future<CharacterSummaryData> getProfileSummary(String name) async {
    return await apiClient.getProfileSummary("bearer $key", name);
  }
}
