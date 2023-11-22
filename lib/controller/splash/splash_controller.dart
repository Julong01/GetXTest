import 'package:auction/data/model/character_summary_models.dart';
import 'package:auction/data/repository/character_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  final CharacterRepository repository;
  SplashController({required this.repository});

  final Rx<VideoPlayerController> _video =
      VideoPlayerController.asset("assets/video/wallpaper.mp4").obs;
  final Rx<TextEditingController> _character =
      TextEditingController(text: "초록색감").obs;

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

  toHome() async {
    CharacterSummaryData data =
        await repository.getProfileSummary(character.text);
    await _video.value.pause();
    Get.offNamed("/main", arguments: {"characterSummary": data});
  }

  TextEditingController get character => _character.value;
  VideoPlayerController get video => _video.value;
}
