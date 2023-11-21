import 'package:auction/controller/splash/splash_controller.dart';
import 'package:auction/view/common/auto_text.dart';
import 'package:auction/view/common/stack_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                top: 250.h,
                bottom: 250.h,
                start: 0,
                end: 0,
                builder: (constraints) => Obx(() => AspectRatio(
                    aspectRatio: controller.video.value.aspectRatio,
                    child: VideoPlayer(controller.video)))),
            StackChild(
                start: 120,
                end: 120,
                height: 70,
                bottom: 100.h,
                builder: (_) => OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.3),
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: AutoText(
                      text: 'START',
                      fontSizeSp: 28,
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          letterSpacing: 5,
                          fontWeight: FontWeight.w300),
                    ),
                    onPressed: () async => await controller.toHome()))
          ],
        ));
  }
}
