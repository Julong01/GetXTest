import 'package:auction/controller/controllers.dart';
import 'package:auction/data/custom_dio/dio_client.dart';
import 'package:auction/data/provider/api.dart';
import 'package:get/get.dart';

import '../data/repository/z_repository.dart';

class IntegrationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<IntegrationController>(() {
      Get.put<AuctionController>(AuctionController(
          repository:
              AuctionsRepository(apiClient: ApiClient(CustomDio().dio))));
      return IntegrationController();
    });
  }
}
