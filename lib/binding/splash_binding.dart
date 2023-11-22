import 'package:auction/controller/splash/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../data/provider/api.dart';
import '../data/repository/character_repository.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashController>(() {
      return SplashController(
          repository: CharacterRepository(apiClient: ApiClient(Dio())));
    });
  }
}
