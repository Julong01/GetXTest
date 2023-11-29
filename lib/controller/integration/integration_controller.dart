import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntegrationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  final List<Tab> tabList = <Tab>[
    const Tab(
      child: Text(
        "경매장",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
    const Tab(
      child: Text(
        "거래소",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
  ];
}
