import 'package:auction/controller/home/home_controller.dart';
import 'package:auction/data/model/character_summary_models.dart';
import 'package:auction/util/util_method.dart';
import 'package:auction/view/common/auto_text.dart';
import 'package:auction/view/common/image_widget.dart';
import 'package:auction/view/common/section.dart';
import 'package:auction/view/common/stack_child.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/home/home_model.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(
        children: [
          Section(
            designSize: const Size(360, 296),
            color: const Color.fromRGBO(21, 24, 29, 1),
            builder: (_, __, ___) => [
              StackChild(
                  top: 15,
                  start: 15,
                  bottom: 15,
                  end: 100,
                  builder: (_) => _buildProfileBox(_))
            ],
          ),
          Section(
            designSize: const Size(360, 204),
            builder: (_, __, ___) => [
              StackChild(
                  height: 20.h,
                  start: 12.w,
                  top: 12.h,
                  builder: (_) => AutoText(text: "공지사항", fontSizeSp: 12)),
              StackChild(
                  height: 184.h,
                  bottom: 0,
                  builder: (_) => SizedBox(
                      width: __.maxWidth,
                      height: __.maxHeight,
                      child: Obx(() => controller.notices.isEmpty
                          ? Container()
                          : SizedBox(
                              width: __.maxWidth,
                              height: __.maxHeight,
                              child: PaginatedDataTable2(
                                  // rowsPerPage: 3,
                                  horizontalMargin: 10,
                                  columnSpacing: 10,
                                  headingRowHeight: 36,
                                  fixedTopRows: 1,
                                  autoRowsToHeight: true,
                                  columns: const [
                                    DataColumn2(
                                        label: Text("type"), fixedWidth: 40),
                                    DataColumn2(
                                        label: Text("title"), fixedWidth: 260),
                                    DataColumn2(
                                        label: Text("date"), fixedWidth: 60),
                                  ],
                                  source:
                                      _DataSource(data: controller.notices)),
                            )))),
            ],
          ),
          Section(
            designSize: const Size(360, 200),
            builder: (_, __, ___) => [
              Obx(
                () => CarouselSlider(
                    carouselController: controller.carousel,
                    items: controller.events.map((event) {
                      return InkWell(
                        onTap: () async => Util.launchUrlLostArc(event.link),
                        child: ImageWidget(
                            imageUrl: event.thumbnail,
                            width: __.maxWidth,
                            radius: 0,
                            height: __.maxHeight),
                      );
                    }).toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 21 / 9,
                        viewportFraction: 1,
                        height: __.maxHeight,
                        scrollDirection: Axis.horizontal,
                        autoPlayAnimationDuration: const Duration(seconds: 5),
                        autoPlayInterval: const Duration(seconds: 5),
                        onPageChanged: (index, reason) {})),
              ),
            ],
          ),
        ],
      ),
    )));
  }

  Widget _buildProfileBox(BoxConstraints constraints) {
    CharacterSummaryData data = Get.arguments["characterSummary"];
    TextStyle ts = const TextStyle(color: Colors.white);

    return Card(
        elevation: 1,
        color: const Color.fromRGBO(21, 24, 29, 1),
        child: Row(
          children: [
            ImageWidget(
                imageUrl: data.characterImage,
                width: constraints.maxWidth / 2,
                height: constraints.maxHeight),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.serverName, style: ts),
                Text(data.guildName ?? "-", style: ts),
                Text(data.characterClassName, style: ts),
                Text(data.title ?? "-", style: ts),
                Text(data.characterLevel.toString(), style: ts),
                Text(data.itemAvgLevel, style: ts),
                Text(data.expeditionLevel.toString(), style: ts),
                Text(data.pvpGradeName, style: ts),
                Text("Lv.${data.townLevel} ${data.townName}", style: ts),
              ],
            ))
          ],
        ));
  }
}

class _DataSource extends DataTableSource {
  final List<Notice> data;
  _DataSource({required this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    final item = data[index];
    return DataRow2(
        onTap: () async => Util.launchUrlLostArc(item.link),
        cells: [
          DataCell(Text(item.type)),
          DataCell(Text(item.title)),
          DataCell(Text(Util.dateString(item.date))),
        ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
