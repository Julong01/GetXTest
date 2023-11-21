import 'package:auction/data/model/news_models.dart';

class Notice {
  final String title;
  final DateTime date;
  final String link;
  final String type;

  Notice(NoticeData data)
      : title = data.title,
        date = data.date,
        link = data.link,
        type = data.type;
}

class Event {
  final String title;
  final String thumbnail;
  final String link;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime? rewardDate;
  Event(EventData data)
      : title = data.title,
        thumbnail = data.thumbnail,
        link = data.link,
        startDate = data.startDate,
        endDate = data.endDate,
        rewardDate = data.rewardDate;
}
