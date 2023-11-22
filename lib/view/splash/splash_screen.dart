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
                start: 40,
                end: 40,
                height: 50,
                bottom: 100.h,
                builder: (_) => Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Obx(() => TextField(
                                controller: controller.character,
                                cursorColor: Colors.white,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    hintText: "캐릭터 명",
                                    hintStyle:
                                        TextStyle(color: Color(0xffdddddd)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffeeeeee)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(0, 0, 0, 0.3),
                                side: const BorderSide(color: Colors.white),
                                fixedSize: const Size(50, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () async => await controller.toHome())
                      ],
                    ))
          ],
        ));
  }
}
