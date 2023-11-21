import 'package:auction/data/model/news_models.dart';
import 'package:auction/data/repository/news_repository.dart';
import 'package:get/get.dart';

import 'home_model.dart';

class HomeController extends GetxController {
  final NewsRepository repository;
  HomeController({required this.repository});

  final RxList<Notice> _notices = <Notice>[].obs;
  List<Notice> get notices => _notices;

  final List<Event> _events = <Event>[].obs;
  List<Event> get events => _events;

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
}
