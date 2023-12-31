import 'package:auction/controller/controllers.dart';
import 'package:auction/view/widgets.dart';
import 'package:collection/collection.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../data/local/drop_down_model.dart';

class AuctionScreen extends GetView<AuctionController> {
  AuctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
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
              child: Obx(
                () => !controller.isLoaded
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(
                        children: [
                          StackChild(
                              top: 10.h,
                              start: 10,
                              end: 10,
                              height: 235.h,
                              builder: (constraints) =>
                                  _buildBasicOptions(constraints)),
                          Obx(() => StackChild(
                              top: 245.h,
                              start: 17.w,
                              end: 17.w,
                              height: controller.isSkills ? 140.h : 45.h,
                              duration: const Duration(milliseconds: 800),
                              builder: (constraints) => Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: controller.isSkills
                                                ? Colors.white
                                                : Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.black),
                                    padding: EdgeInsets.all(10.h),
                                    child: _buildSkillsOption(
                                        constraints, controller.isSkills),
                                  ))),
                          Obx(() => StackChild(
                              top: controller.isSkills
                                  ? 245.h + 150.h
                                  : 245.h + 55.h,
                              start: 17.w,
                              end: 17.w,
                              height: controller.isEtc ? 270.h : 45.h,
                              duration: const Duration(milliseconds: 800),
                              builder: (constraints) => Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: controller.isEtc
                                                ? Colors.white
                                                : Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.black),
                                    padding: EdgeInsets.all(10.h),
                                    child: _buildEtcOption(
                                        constraints, controller.isEtc),
                                  ))),
                        ],
                      ),
              ))),
    );
  }

  Widget _buildBasicOptions(BoxConstraints constraints) {
    TextStyle labelStyle = const TextStyle(color: Colors.white);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          StackChild(
            top: 0,
            start: 0,
            height: 68.h,
            width: 110.w,
            builder: (_) => Obx(() => _buildDropDown(
                _,
                "카테고리",
                Icons.category_rounded,
                controller.categories!,
                controller.selectedCategory!,
                (data) => controller.setCurrentCategory(data))),
          ),
          _buildItemNameField(labelStyle),
          StackChild(
            top: 75.h,
            start: 0,
            height: 68.h,
            width: 110.w,
            builder: (_) => Obx(() => _buildDropDown(
                _,
                "직업",
                Icons.class_outlined,
                controller.classList!,
                controller.selectedClass!,
                (data) => controller.setCurrentClass(data))),
          ),
          StackChild(
            top: 75.h,
            end: 105.w,
            height: 68.h,
            width: 85.w,
            builder: (_) => Obx(() => _buildDropDown(
                _,
                "아이템 등급",
                Icons.grade_rounded,
                controller.gradeList!,
                controller.selectedGrade!,
                (data) => controller.setCurrentGrade(data))),
          ),
          StackChild(
            top: 75.h,
            end: 0.w,
            height: 68.h,
            width: 85.w,
            builder: (_) => Obx(
              () => _buildDropDown(
                _,
                "품질",
                Icons.high_quality_rounded,
                controller.qualityList!,
                controller.selectedQuality!,
                controller.isAccessories
                    ? (data) => controller.setCurrentQuality(data)
                    : null,
              ),
            ),
          ),
          StackChild(
            top: 150.h,
            start: 0.w,
            height: 68.h,
            width: 110.w,
            builder: (_) => Obx(
              () => _buildDropDown(
                _,
                "아이템 티어",
                CupertinoIcons.chart_bar_circle,
                controller.itemTierList!,
                controller.selectedItemTier!,
                (data) => controller.setCurrentItemTier(data),
              ),
            ),
          ),
          _buildItemLevelField(labelStyle)
        ],
      ),
    );
  }

  Widget _buildEtcDropDown(BoxConstraints constraints, List<DropDownData> list,
      DropDownData select, Function(DropDownData data)? onChange) {
    return Expanded(
        flex: 8,
        child: SizedBox(
            height: 40.h,
            width: constraints.maxWidth,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<dynamic>(
                isExpanded: true,
                iconStyleData: const IconStyleData(
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Colors.white),
                items: list
                    .map((e) => [
                          DropdownMenuItem(
                            value: e,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                e.title,
                                style: TextStyle(
                                    color: onChange == null
                                        ? Colors.grey
                                        : e.titleColor ?? Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          if (list.last != e)
                            DropdownMenuItem(
                              enabled: false,
                              value: DropDownData.enable(),
                              child: const Divider(),
                            )
                        ])
                    .expand((x) => x)
                    .toList(),
                value: select,
                onChanged: onChange == null ? null : (s) => onChange(s),
                buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                onChange == null ? Colors.grey : Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    padding: const EdgeInsets.all(5).copyWith(left: 0),
                    width: constraints.maxWidth,
                    height: 44.h),
                menuItemStyleData: MenuItemStyleData(
                    height: 40.h,
                    padding: const EdgeInsets.all(0),
                    customHeights: list
                        .map((e) => [40.h, if (list.last != e) 1.h])
                        .expand((x) => x)
                        .toList(),
                    selectedMenuItemBuilder: (context, widget) => Container(
                          color: Colors.white.withOpacity(0.3),
                          margin: EdgeInsets.symmetric(
                              horizontal: 2.h, vertical: 1.h),
                          child: widget,
                        )),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 167.h,
                  padding: const EdgeInsets.all(0).copyWith(top: 1),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.black,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(4),
                          bottomLeft: Radius.circular(4))),
                ),
              ),
            )));
  }

  Widget _buildDropDown(
      BoxConstraints constraints,
      String? label,
      IconData? icons,
      List<DropDownData> list,
      DropDownData select,
      Function(DropDownData data)? onChange) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null || icons != null)
            SizedBox(
                height: 20.h,
                child: Row(
                  children: [
                    AutoText(
                      text: label,
                      fontSizeSp: 12,
                      style: TextStyle(
                          color: onChange == null ? Colors.grey : Colors.white),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Icon(
                      icons,
                      size: 13,
                      color: onChange == null ? Colors.grey : Colors.white,
                    )
                  ],
                )),
          if (label != null || icons != null)
            SizedBox(
              height: 4.h,
            ),
          SizedBox(
              height: 40.h,
              width: constraints.maxWidth,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<dynamic>(
                  isExpanded: true,
                  iconStyleData: const IconStyleData(
                      iconDisabledColor: Colors.grey,
                      iconEnabledColor: Colors.white),
                  items: list
                      .map((e) => [
                            DropdownMenuItem(
                              value: e,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  e.title,
                                  style: TextStyle(
                                      color: onChange == null
                                          ? Colors.grey
                                          : e.titleColor ?? Colors.white,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            if (list.last != e)
                              DropdownMenuItem(
                                enabled: false,
                                value: DropDownData.enable(),
                                child: const Divider(),
                              )
                          ])
                      .expand((x) => x)
                      .toList(),
                  value: select,
                  onChanged: onChange == null ? null : (s) => onChange(s),
                  buttonStyleData: ButtonStyleData(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: onChange == null
                                  ? Colors.grey
                                  : Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      padding: const EdgeInsets.all(5).copyWith(left: 0),
                      width: constraints.maxWidth,
                      height: 44.h),
                  menuItemStyleData: MenuItemStyleData(
                      height: 40.h,
                      padding: const EdgeInsets.all(0),
                      customHeights: list
                          .map((e) => [40.h, if (list.last != e) 1.h])
                          .expand((x) => x)
                          .toList(),
                      selectedMenuItemBuilder: (context, widget) => Container(
                            color: Colors.white.withOpacity(0.3),
                            margin: EdgeInsets.symmetric(
                                horizontal: 2.h, vertical: 1.h),
                            child: widget,
                          )),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 167.h,
                    padding: const EdgeInsets.all(0).copyWith(top: 1),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.black,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(4),
                            bottomLeft: Radius.circular(4))),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildItemNameField(TextStyle style) {
    return StackChild(
        top: 0,
        end: 0,
        height: 68.h,
        width: 190.w,
        builder: (_) => SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 20.h,
                      child: Row(
                        children: [
                          AutoText(
                            text: "아이템 이름",
                            fontSizeSp: 12,
                            style: style,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          const Icon(
                            CupertinoIcons.cube_box_fill,
                            size: 13,
                            color: Colors.white,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: _.maxWidth,
                    child: Obx(() => TextField(
                          controller: controller.itemName,
                          cursorColor: Colors.white,
                          textAlign: TextAlign.start,
                          cursorWidth: 1,
                          onTapOutside: (event) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              hintText: "(검색어 입력)",
                              hintStyle: TextStyle(color: Color(0xffdddddd)),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffeeeeee)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        )),
                  )
                ],
              ),
            ));
  }

  Widget _buildItemLevelField(TextStyle style) {
    return StackChild(
        top: 150.h,
        end: 0,
        height: 68.h,
        width: 190.w,
        builder: (_) => SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 20.h,
                      child: Row(
                        children: [
                          AutoText(
                            text: "아이템 레벨",
                            fontSizeSp: 12,
                            style: style,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          const Icon(
                            CupertinoIcons.desktopcomputer,
                            size: 13,
                            color: Colors.white,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: _.maxWidth,
                    child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 85.w,
                              child: TextField(
                                controller: controller.itemMinLv,
                                cursorColor: Colors.white,
                                textAlign: TextAlign.start,
                                cursorWidth: 1,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'[0-9]]')),
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                onTapOutside: (event) {
                                  if (!controller.validatorMinValue()) {
                                    controller.itemMinLv.text = "0";
                                  }
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                onSubmitted: (str) {
                                  if (!controller.validatorMinValue()) {
                                    controller.itemMinLv.text = "0";
                                  }
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                onEditingComplete: () {
                                  if (!controller.validatorMinValue()) {
                                    controller.itemMinLv.text = "0";
                                  }
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    hintText: "최소 레벨",
                                    hintStyle:
                                        TextStyle(color: Color(0xffdddddd)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffeeeeee)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                              child: const Icon(
                                CupertinoIcons.bolt_horizontal_fill,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                            SizedBox(
                              width: 85.w,
                              child: TextField(
                                controller: controller.itemMaxLv,
                                cursorColor: Colors.white,
                                textAlign: TextAlign.start,
                                cursorWidth: 1,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'[0-9]]')),
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                onTapOutside: (event) {
                                  if (!controller.validatorMaxValue()) {
                                    controller.itemMaxLv.text = controller
                                        .response.maxItemLevel
                                        .toString();
                                  }
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                onSubmitted: (str) {
                                  if (!controller.validatorMaxValue()) {
                                    controller.itemMaxLv.text = controller
                                        .response.maxItemLevel
                                        .toString();
                                  }
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                onEditingComplete: () {
                                  if (!controller.validatorMaxValue()) {
                                    controller.itemMaxLv.text = controller
                                        .response.maxItemLevel
                                        .toString();
                                  }
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    hintText: "최대 레벨",
                                    hintStyle:
                                        TextStyle(color: Color(0xffdddddd)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffeeeeee)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ));
  }

  Widget _buildSkillsOption(BoxConstraints constraints, bool isSkills) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100.h,
                  child: Row(
                    children: [
                      AutoText(
                        text: "스킬 상세 옵션",
                        fontSizeSp: 12,
                        style: TextStyle(
                            color: !isSkills ? Colors.grey : Colors.white),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        !isSkills
                            ? CupertinoIcons.arrowtriangle_up
                            : CupertinoIcons.arrowtriangle_down,
                        size: 13,
                        color: !isSkills ? Colors.grey : Colors.white,
                      )
                    ],
                  )),
              SizedBox(
                  width: 100.h,
                  height: 20.h,
                  child: BaseWidget(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: !isSkills ? Colors.grey : Colors.white,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      onTap: () => controller.setSkillsOptions(),
                      builder: (_) => Row(
                            children: [
                              SizedBox(
                                  height: 20.h,
                                  width: 20.h,
                                  child: Icon(
                                    Icons.refresh_rounded,
                                    color:
                                        !isSkills ? Colors.grey : Colors.white,
                                    size: 18.h,
                                  )),
                              SizedBox(
                                width: 2.w,
                              ),
                              AutoText(
                                text: "전체 되돌리기",
                                fontSizeSp: 12,
                                style: TextStyle(
                                    color:
                                        !isSkills ? Colors.grey : Colors.white),
                              ),
                            ],
                          ))),
            ],
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Expanded(
          child: Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: constraints.maxWidth,
              height: isSkills ? 140.h : 0.h,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.h).copyWith(bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSearchDropDown(
                                140.w,
                                controller.firstSkill,
                                controller.firstSkillOption,
                                controller.selectedFirst,
                                1,
                                (data) =>
                                    controller.setCurrentFirstSkill(data)),
                            SizedBox(
                              width: 10.w,
                            ),
                            _buildSearchDropDown(
                                140.w,
                                null,
                                controller.firstSkillsTri,
                                controller.selectedFirstTri,
                                1,
                                (data) => controller.setCurrentFirstTri(data)),
                          ]),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 10.h,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSearchDropDown(
                              140.w,
                              controller.secondSkill,
                              controller.secondSkillOption,
                              controller.selectedSecond,
                              1,
                              (data) => controller.setCurrentSecondSkill(data)),
                          SizedBox(
                            width: 10.w,
                          ),
                          _buildSearchDropDown(
                              140.w,
                              null,
                              controller.secondSkillsTri,
                              controller.selectedSecondTri,
                              1,
                              (data) => controller.setCurrentSecondTri(data)),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
        )
      ],
    );
  }

  Widget _buildEtcOption(BoxConstraints constraints, bool isEtc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100.h,
                  child: Row(
                    children: [
                      AutoText(
                        text: "기타 상세 옵션",
                        fontSizeSp: 12,
                        style: TextStyle(
                            color: !isEtc ? Colors.grey : Colors.white),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        !isEtc
                            ? CupertinoIcons.arrowtriangle_up
                            : CupertinoIcons.arrowtriangle_down,
                        size: 13,
                        color: !isEtc ? Colors.grey : Colors.white,
                      )
                    ],
                  )),
              SizedBox(
                  width: 100.h,
                  height: 20.h,
                  child: BaseWidget(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: !isEtc ? Colors.grey : Colors.white,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      onTap: () => controller.setEtcOptions(),
                      builder: (_) => Row(
                            children: [
                              SizedBox(
                                  height: 20.h,
                                  width: 20.h,
                                  child: Icon(
                                    Icons.refresh_rounded,
                                    color: !isEtc ? Colors.grey : Colors.white,
                                    size: 18.h,
                                  )),
                              SizedBox(
                                width: 2.w,
                              ),
                              AutoText(
                                text: "전체 되돌리기",
                                fontSizeSp: 12,
                                style: TextStyle(
                                    color: !isEtc ? Colors.grey : Colors.white),
                              ),
                            ],
                          ))),
            ],
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Expanded(
          child: Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: constraints.maxWidth,
              height: isEtc ? 247.h : 0.h,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.etcOptions
                        .mapIndexed((idx, etcOption) => [
                              Expanded(
                                flex: 10,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildEtcDropDown(
                                          BoxConstraints(maxWidth: 100.w),
                                          etcOption!,
                                          controller.selectedOption[idx]!,
                                          (data) => controller
                                              .setCurrentEtcOptions(data, idx)),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      _buildSearchDropDown(
                                        50.w,
                                        TextEditingController(),
                                        controller.etcOptionsSubs[idx],
                                        controller.selectedOptionSub[idx]!,
                                        10,
                                        (data) => controller
                                            .setCurrentEtcSubOptions(data, idx),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      SizedBox(
                                        width: 45.w,
                                        height: 35.h,
                                        child: TextField(
                                          controller:
                                              controller.slotMinList[idx],
                                          cursorColor: Colors.white,
                                          textAlign: TextAlign.start,
                                          cursorWidth: 1,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(
                                                RegExp(r'[0-9]]')),
                                            LengthLimitingTextInputFormatter(3),
                                          ],
                                          onTapOutside: (event) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          onSubmitted: (str) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          onEditingComplete: () {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              hintText: "min",
                                              hintStyle: const TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xffdddddd)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: isEtc ? 1 : 0,
                                                    color: const Color(
                                                        0xffeeeeee)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: isEtc ? 1 : 0,
                                                      color: Colors.white))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      SizedBox(
                                        width: 45.w,
                                        height: 35.h,
                                        child: TextField(
                                          controller:
                                              controller.slotMaxList[idx],
                                          cursorColor: Colors.white,
                                          textAlign: TextAlign.start,
                                          cursorWidth: 1,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(
                                                RegExp(r'[0-9]]')),
                                            LengthLimitingTextInputFormatter(3),
                                          ],
                                          onTapOutside: (event) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          onSubmitted: (str) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          onEditingComplete: () {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              hintText: "max",
                                              hintStyle: const TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xffdddddd)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: isEtc ? 1 : 0,
                                                  color:
                                                      const Color(0xffeeeeee),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: isEtc ? 1 : 0,
                                                      color: Colors.white))),
                                        ),
                                      ),
                                    ]),
                              ),
                              if (etcOption != controller.etcOptions.last)
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 10.h,
                                  ),
                                ),
                            ])
                        .expand((x) => x)
                        .toList()),
              ))),
        )
      ],
    );
  }

  Widget _buildSearchDropDown(
      double width,
      TextEditingController? text,
      List<DropDownData>? list,
      DropDownData? select,
      int flex,
      Function(DropDownData data)? onChange) {
    if (list == null) {
      return const SizedBox();
    }
    return Expanded(
        flex: flex,
        child: SizedBox(
            height: 35.h,
            width: width,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<dynamic>(
                isExpanded: true,
                iconStyleData: const IconStyleData(
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Colors.white),
                items: list
                    .map((e) => [
                          DropdownMenuItem(
                            value: e,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                e.title,
                                style: TextStyle(
                                    color: onChange == null
                                        ? Colors.grey
                                        : e.titleColor ?? Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          if (list.last != e)
                            DropdownMenuItem(
                              enabled: false,
                              value: DropDownData.enable(),
                              child: const Divider(),
                            )
                        ])
                    .expand((x) => x)
                    .toList(),
                value: select,
                onChanged: onChange == null ? null : (s) => onChange(s),
                buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                onChange == null ? Colors.grey : Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    padding: const EdgeInsets.all(5).copyWith(left: 0),
                    width: width,
                    height: 44.h),
                menuItemStyleData: MenuItemStyleData(
                    height: 40.h,
                    padding: const EdgeInsets.all(0),
                    customHeights: list
                        .map((e) => [40.h, if (list.last != e) 1.h])
                        .expand((x) => x)
                        .toList(),
                    selectedMenuItemBuilder: (context, widget) => Container(
                          color: Colors.white.withOpacity(0.3),
                          margin: EdgeInsets.symmetric(
                              horizontal: 2.h, vertical: 1.h),
                          child: widget,
                        )),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 167.h,
                  padding: const EdgeInsets.all(0).copyWith(top: 1),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.black,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(4),
                          bottomLeft: Radius.circular(4))),
                ),
                dropdownSearchData: text == null
                    ? null
                    : DropdownSearchData(
                        searchController: text,
                        searchInnerWidgetHeight: 50,
                        searchInnerWidget: Container(
                          height: 50,
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                          child: TextFormField(
                            expands: true,
                            maxLines: null,
                            controller: text,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        searchMatchFn: (item, searchValue) {
                          return item.value.toString().contains(searchValue);
                        },
                      ),
                onMenuStateChange: (text == null)
                    ? (isOpen) {}
                    : (isOpen) {
                        if (!isOpen) {
                          text.clear();
                        }
                      },
              ),
            )));
  }
}
