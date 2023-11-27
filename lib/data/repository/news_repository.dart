import 'package:auction/data/model/siblings_models.dart';
import 'package:auction/data/provider/api.dart';

import '../model/news_models.dart';

class NewsRepository {
  final ApiClient apiClient;

  NewsRepository({required this.apiClient});

  Future<List<NoticeData>> getNotices() async {
    return await apiClient.getNotices();
  }

  Future<List<EventData>> getEvents() async {
    return await apiClient.getEvents();
  }

  Future<List<SiblingsData>> getSiblings(String characterName) async {
    return await apiClient.getSiblings(characterName);
  }
}
