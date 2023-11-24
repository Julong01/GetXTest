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

  CarouselController get carousel => _carousel.value;
  List<Notice> get notices => _notices;
  List<Event> get events => _events;
}
