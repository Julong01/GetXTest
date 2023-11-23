import 'package:auction/data/model/z_models.dart';
import 'package:auction/data/provider/api.dart';

class CharacterRepository {
  final ApiClient apiClient;
  CharacterRepository({required this.apiClient});

  Future<CharacterSummaryData> getProfileSummary(String name) async {
    return await apiClient.getProfileSummary(name);
  }
}
