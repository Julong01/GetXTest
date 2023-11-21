import 'package:auction/controller/home/home_controller.dart';
import 'package:auction/util/util_method.dart';
import 'package:auction/view/common/section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_model.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(
        children: [
          Section(
            designSize: const Size(360, 400),
            color: Colors.red,
            builder: (_, __, ___) => [
              SizedBox(
                  width: __.maxWidth,
                  height: __.maxHeight,
                  child: Obx(() => controller.notices.isEmpty
                      ? Container()
                      : SizedBox(
                          width: __.maxWidth,
                          height: __.maxHeight,
                          child: PaginatedDataTable(
                              header: const Text("공지사항"),
                              rowsPerPage: 5,
                              availableRowsPerPage: const [1, 30, 25],
                              columns: const [
                                DataColumn(label: Text("type")),
                                DataColumn(label: Text("title")),
                                DataColumn(label: Text("date")),
                              ],
                              source: _DataSource(data: controller.notices)),
                        )))
            ],
          )
        ],
      ),
    )));
  }

  Widget _buildEvent(Event data) {
    return Card(
      elevation: 1,
      child: Column(
        children: [
          Text(data.title),
          Text(data.thumbnail),
          Text(data.link),
          Text(data.startDate.toString()),
          Text(data.endDate.toString()),
          Text(data.rewardDate.toString()),
        ],
      ),
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
    print(item.link);
    return DataRow(cells: [
      DataCell(Text(item.type)),
      DataCell(InkWell(
          onTap: () async => Util.launchUrlLostArc(item.link),
          child: Text(item.title))),
      DataCell(Text(item.date.toString())),
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
