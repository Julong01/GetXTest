import 'package:auction/controller/controllers.dart';
import 'package:auction/data/repository/character_repository.dart';
import 'package:get/get.dart';

import '../data/custom_dio/dio_client.dart';
import '../data/provider/api.dart';

class InfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoController>(() => InfoController(
        repository:
            CharacterRepository(apiClient: ApiClient(CustomDio().dio))));
  }
}
