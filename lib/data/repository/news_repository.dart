import 'package:auction/data/provider/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/news_models.dart';

class NewsRepository {
  final ApiClient apiClient;
  final String key;
  NewsRepository({required this.apiClient}) : key = dotenv.env["apiKey"]!;

  Future<List<NoticeData>> getNotices() async {
    return await apiClient.getNotices("bearer $key");
  }

  Future<List<EventData>> getEvents() async {
    return await apiClient.getEvents("bearer $key");
  }
}
