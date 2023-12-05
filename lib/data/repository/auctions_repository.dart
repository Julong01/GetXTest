import 'package:auction/data/model/z_models.dart';
import 'package:auction/data/provider/api.dart';

class AuctionsRepository {
  final ApiClient apiClient;
  AuctionsRepository({required this.apiClient});

  getAuctionsOptions() async {
    return await apiClient.getAuctionsOptions();
  }
}
