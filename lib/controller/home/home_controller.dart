import 'package:auction/data/model/z_models.dart';
import 'package:auction/data/repository/z_repository.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import 'home_model.dart';

class HomeController extends GetxController {
  final NewsRepository repository;
  HomeController({required this.repository});

  final RxList<Notice> _notices = <Notice>[].obs;
  final RxList<Event> _events = <Event>[].obs;
  final Rx<CarouselController> _carousel = CarouselController().obs;
  final CharacterSummaryData data = Get.arguments["characterSummary"];

  @override
  void onInit() {
    // TODO: implement onInit
    getNotices();
    getEvents();
    super.onInit();
  }

  getNotices() async {
    List<NoticeData> list = await repository.getNotices();
    for (NoticeData d in list) {
      _notices.add(Notice(d));
    }
  }

  getEvents() async {
    List<EventData> list = await repository.getEvents();
    for (EventData e in list) {
      _events.add(Event(e));
    }
  }

  toSplash() {
    Get.offAllNamed("/");
  }

  toInfo() async {
    List<SiblingsData> list = await repository.getSiblings(
        (Get.arguments["characterSummary"] as CharacterSummaryData)
            .characterName);
    list.sort((a, b) => b.itemAvgLevel.compareTo(a.itemAvgLevel));
    Get.toNamed("/info", arguments: {"siblings": list});
  }

  CarouselController get carousel => _carousel.value;
  List<Notice> get notices => _notices;
  List<Event> get events => _events;
}
