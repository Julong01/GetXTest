import 'package:auction/controller/home/home_controller.dart';
import 'package:auction/data/provider/api.dart';
import 'package:auction/data/repository/news_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository: NewsRepository(apiClient: ApiClient(Dio())));
    });
  }
}
