import 'package:auction/src/constants.dart';
import 'package:auction/util/util_method.dart';
import 'package:auction/controller/controllers.dart';
import 'package:auction/data/model/z_models.dart';
import 'package:auction/view/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: SingleChildScrollView(
      child: Column(
        children: [
          Section(
            designSize: const Size(360, 296),
            color: const Color.fromRGBO(21, 24, 29, 1),
            relativePadding: const EdgeInsets.all(10).copyWith(bottom: 0),
            builder: (_, __, ___) => [
              StackChild(
                  top: 0,
                  start: 20,
                  height: 25,
                  builder: (_) => AutoText(
                        text: (Get.find<HomeController>().data.characterName),
                        fontSizeSp: 20,
                        style: const TextStyle(color: Colors.white),
                      )),
              StackChild(
                  top: 0, end: 20, height: 28, builder: (_) => _buildButtons()),
              StackChild(
                  top: 25,
                  start: 0,
                  bottom: 0,
                  end: 0,
                  builder: (_) => _buildProfileBox(_))
            ],
          ),
          Section(
            designSize: const Size(360, 200),
            relativePadding: const EdgeInsets.symmetric(vertical: 15),
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
          Section(
            designSize: const Size(360, 204),
            relativePadding: const EdgeInsets.all(10).copyWith(top: 0),
            builder: (_, __, ___) => [
              StackChild(
                  height: 20.h,
                  start: 12.w,
                  top: 0.h,
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
        ],
      ),
    ))));
  }

  Widget _buildProfileBox(BoxConstraints constraints) {
    CharacterSummaryData data = Get.find<HomeController>().data;

    return Card(
      elevation: 1,
      color: const Color.fromRGBO(21, 24, 29, 1),
      child: Row(
        children: [
          ImageWidget(
              imageUrl:
                  data.characterImage ?? pathToClass(data.characterClassName),
              width: constraints.maxWidth / 2.5,
              height: constraints.maxHeight - 34),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfo("서 버", data.serverName),
                const SizedBox(
                  height: 3,
                ),
                _buildInfo("길 드", data.guildName ?? "-"),
                const SizedBox(
                  height: 3,
                ),
                _buildInfo("클래스", data.characterClassName),
                const SizedBox(
                  height: 3,
                ),
                _buildInfo("칭 호", data.title ?? "-"),
                const SizedBox(
                  height: 3,
                ),
                _buildInfo("전 투", data.characterLevel.toString()),
                const SizedBox(
                  height: 3,
                ),
                _buildInfo("아이템", data.itemAvgLevel),
                const SizedBox(
                  height: 3,
                ),
                _buildInfo("원정대", data.expeditionLevel.toString()),
                const SizedBox(
                  height: 3,
                ),
                _buildInfo("PVP", data.pvpGradeName),
                const SizedBox(
                  height: 3,
                ),
                _buildInfo("영 지", "Lv.${data.townLevel} ${data.townName}"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfo(String title, String text) {
    double spacing = title == "PVP" ? 8 : (!title.contains(" ") ? 2 : 6);
    TextStyle ts = TextStyle(color: Colors.white, letterSpacing: spacing);
    return Expanded(
        child: Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color.fromRGBO(51, 52, 53, 1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: 60,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: AutoText(
            text: title,
            fontSizeSp: 14,
            style: ts,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        AutoText(
          text: text,
          fontSizeSp: 13,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    ));
  }

  Widget _buildButtons() {
    HomeController controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: IconButton(
            onPressed: () => controller.toInfo(),
            iconSize: 15,
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.group,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: IconButton(
            onPressed: () {},
            iconSize: 15,
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.storefront,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: IconButton(
            onPressed: () => controller.toSplash(),
            iconSize: 15,
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.undo_sharp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
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
