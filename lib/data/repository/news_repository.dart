import 'package:auction/data/provider/api.dart';

class NewsRepository {
  final ApiClient apiClient;

  NewsRepository({required this.apiClient});

  getNotices() {
    return apiClient.getNotices();
  }

  getEvents() {
    return apiClient.getEvents();
  }
}
