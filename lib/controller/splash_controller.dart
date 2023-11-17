import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  final Rx<VideoPlayerController> _video =
      VideoPlayerController.asset("assets/video/wallpaper.mp4").obs;
  VideoPlayerController get video => _video.value;
  @override
  void onInit() {
    // TODO: implement onInit
    _video.value.initialize().then((value) => update());
    _video.value.setLooping(true);
    _video.value.play();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _video.close();
    super.onClose();
  }

  toHome() {
    Get.offNamed("/main");
  }
}
