import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  final Rx<VideoPlayerController> controller =
      VideoPlayerController.asset("assets/video/wallpaper.mp4").obs;
}
