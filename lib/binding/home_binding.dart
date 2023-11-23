import 'package:auction/controller/controllers.dart';
import 'package:auction/data/custom_dio/dio_client.dart';
import 'package:auction/data/repository/z_repository.dart';
import 'package:auction/data/provider/api.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository: NewsRepository(apiClient: ApiClient(CustomDio().dio)));
    });
  }
}
