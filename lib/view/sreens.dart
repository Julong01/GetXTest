import 'package:auction/binding/count_binding.dart';
import 'package:auction/binding/splash_binding.dart';
import 'package:auction/router.dart';
import 'package:auction/view/Home/home_screen.dart';
import 'package:auction/view/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), binding: CountBinding()),
  ];
}
