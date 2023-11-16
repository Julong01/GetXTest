import 'package:auction/controller/count_controller.dart';
import 'package:auction/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashController>(() {
      return SplashController();
    });
  }
}
