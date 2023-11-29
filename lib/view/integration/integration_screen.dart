import 'package:auction/controller/controllers.dart';
import 'package:auction/view/common/custom_appbar.dart';
import 'package:auction/view/integration/auction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IntegrationScreen extends GetView<IntegrationController> {
  IntegrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(84.h),
        child: CustomAppBar(
          title: "Integration",
          bottom: TabBar(
            indicatorColor: const Color(0xffdaa520),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: const Color(0xffdaa520),
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 4,
            tabs: controller.tabList,
            controller: controller.tabController,
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          AuctionScreen(),
          Container(
            color: Colors.blue,
          )
        ],
      ),
    ));
  }
}
