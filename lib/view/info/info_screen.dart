import 'package:auction/controller/controllers.dart';
import 'package:auction/data/model/siblings_models.dart';
import 'package:auction/view/common/custom_appbar.dart';
import 'package:auction/view/common/image_widget.dart';
import 'package:auction/view/common/stack_child.dart';
import 'package:auction/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../src/constants.dart';

class InfoScreen extends GetView<InfoController> {
  InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(48.h),
                child: const CustomAppBar(title: "Info")),
            backgroundColor: const Color.fromRGBO(51, 54, 59, 1),
            body: GetBuilder<InfoController>(
              builder: (_) => _.list.isEmpty
                  ? const LinearProgressIndicator()
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 160 / 250),
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) => Card(
                        child: Stack(
                          children: [
                            StackChild(
                              top: 0,
                              bottom: 70,
                              start: 0,
                              end: 0,
                              builder: (constraints) => ImageWidget.constraints(
                                imageUrl: _.list[index].characterImage ??
                                    pathToClass(
                                        _.list[index].characterClassName),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                fit: BoxFit.fill,
                                constraints: constraints,
                              ),
                            ),
                            StackChild(
                              height: 20,
                              bottom: 40,
                              start: 0,
                              end: 0,
                              builder: (constraints) => AutoText(
                                  text:
                                      "@${_.list[index].serverName}.${_.list[index].characterName}",
                                  fontSizeSp: 11),
                            ),
                            StackChild(
                              height: 20,
                              bottom: 10,
                              start: 0,
                              end: 0,
                              builder: (constraints) => AutoText(
                                  text: _.list[index].itemAvgLevel,
                                  fontSizeSp: 11),
                            ),
                          ],
                        ),
                      ),
                      itemCount: _.list.length,
                    ),
            )));
  }
}
