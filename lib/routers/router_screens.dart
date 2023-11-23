import 'package:auction/binding/bindings.dart';
import 'package:auction/routers/router.dart';
import 'package:auction/view/screens.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
  ];
}
