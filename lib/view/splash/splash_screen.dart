import 'package:auction/controller/splash_controller.dart';
import 'package:auction/view/common/stack_child.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.3),
        body: Stack(
          children: [
            StackChild(
                top: 150,
                bottom: 150,
                builder: (constraints) => Obx(() => AspectRatio(
                      aspectRatio:
                          controller.controller.value.value.aspectRatio,
                      child: VideoPlayer(controller.controller.value),
                    )))
          ],
        ));
  }
}
