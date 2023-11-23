import 'package:auction/data/model/z_models.dart';
import 'package:auction/data/repository/z_repository.dart';
import 'package:flutter/material.dart';
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
    try {
      CharacterSummaryData data =
          await repository.getProfileSummary(character.text);
      await _video.value.pause();
      Get.offNamed("/main", arguments: {"characterSummary": data});
    } on TypeError catch (e) {
      Get.defaultDialog(
          title: "알림",
          content: const Text(
            '캐릭터 정보가 없습니다.\n 계정 보호조치 상태이거나 캐릭터명을 확인해 주세요.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          textConfirm: "확인",
          confirmTextColor: Colors.white,
          onConfirm: () {
            _character.value.clear();
            Get.back();
          });
    }
  }

  TextEditingController get character => _character.value;
  VideoPlayerController get video => _video.value;
}
