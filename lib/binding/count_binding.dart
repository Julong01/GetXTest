import 'package:auction/controller/count_controller.dart';
import 'package:get/get.dart';

class CountBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CountController>(() {
      return CountController();
    });
  }
}
