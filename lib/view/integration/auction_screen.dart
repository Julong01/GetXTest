import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auction/controller/controllers.dart';
import 'package:auction/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class AuctionScreen extends GetView<AuctionController> {
  AuctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: SpeedDial(
        openCloseDial: controller.isDialOpen,
        onOpen: () {},
        onClose: () => controller.isDialBtnClosed(),
        onPress: () => controller.isDialBtnClicked(),
        overlayOpacity: 0,
        backgroundColor: const Color(0xffdaa520),
        curve: Curves.elasticInOut,
        animationDuration: const Duration(milliseconds: 500),
        shape: const CircleBorder(),
        spacing: 5,
        icon: Icons.menu,
        activeIcon: Icons.close,
        iconTheme: const IconThemeData(color: Colors.white),
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            shape: const StadiumBorder(),
            label: "저장",
            labelStyle: const TextStyle(color: Colors.white, fontSize: 18),
            backgroundColor: Colors.red,
            labelBackgroundColor: Colors.grey,
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.file_download,
              color: Colors.white,
            ),
            shape: const StadiumBorder(),
            label: "불러오기",
            labelStyle: const TextStyle(color: Colors.white, fontSize: 18),
            backgroundColor: Colors.blue,
            labelBackgroundColor: Colors.grey,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        width: 360.w,
        height: 780.h,
        child: Stack(
          children: [
            Obx(() => (controller.isLoaded)
                ? StackChild(
                    top: 10,
                    start: 10,
                    end: 10,
                    height: 210.h,
                    builder: (constraints) => _buildBasicOptions(constraints))
                : Container()),
            Obx(
              () => StackChild(
                  top: 230,
                  start: 10,
                  end: 10,
                  height: controller.isSkills ? 210 : 0,
                  duration: const Duration(milliseconds: 800),
                  builder: (constraints) => Container(
                        color: Colors.blue,
                      )),
            )
          ],
        ),
      )),
    );
  }

  Widget _buildBasicOptions(BoxConstraints constraints) {
    TextStyle lableStyle = const TextStyle(color: Colors.white);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          StackChild(
              top: 0,
              start: 0,
              height: 72.h,
              width: 130.w,
              builder: (_) => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                          child: AutoText(
                            text: "카테고리",
                            fontSizeSp: 12,
                            style: lableStyle,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedBox(
                          height: 48.h,
                          width: _.maxWidth,
                          child: CustomDropdown<DropDownData>(
                            initialItem: controller.categories![0],
                            items: controller.categories,
                            excludeSelected: false,
                            onChanged: (val) =>
                                controller.setCurrentCategory(val),
                            hintBuilder: (context, str) => Container(
                              width: _.maxWidth,
                              height: 48.h,
                              child: Text(str),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}
