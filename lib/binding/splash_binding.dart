import 'package:auction/controller/controllers.dart';
import 'package:auction/data/custom_dio/dio_client.dart';
import 'package:auction/data/repository/z_repository.dart';
import 'package:get/get.dart';

import '../data/provider/api.dart';
import '../data/repository/character_repository.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashController>(() {
      return SplashController(
          repository:
              CharacterRepository(apiClient: ApiClient(CustomDio().dio)));
    });
  }
}
