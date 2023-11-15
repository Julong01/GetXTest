import 'package:get/get.dart';

class CountController extends GetxController {
  RxInt _count = 0.obs;
  RxInt get count => _count;

  void increment() {
    _count++;
  }

  void decrement() {
    _count--;
  }
}
