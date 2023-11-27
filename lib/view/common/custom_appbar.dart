import 'package:auction/view/common/auto_text.dart';
import 'package:auction/view/common/stack_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(21, 24, 29, 1),
        title: Text(
          title,
          style: const TextStyle(color: Color(0xffc0c0c0), fontSize: 20),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
            color: Color(0xffc0c0c0),
          ),
          onPressed: () => Get.back(),
        ));
  }
}
