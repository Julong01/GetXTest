import 'package:json_annotation/json_annotation.dart';
part 'news_models.g.dart';

@JsonSerializable()
class NoticeData {
  @JsonKey(name: "Title")
  final String title;
  @JsonKey(name: "Date")
  final DateTime date;
  @JsonKey(name: "Link")
  final String link;
  @JsonKey(name: "Type")
  final String type;

  NoticeData(
      {required this.title,
      required this.date,
      required this.link,
      required this.type});

  factory NoticeData.fromJson(Map<String, dynamic> json) =>
      _$NoticeDataFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeDataToJson(this);
}

@JsonSerializable()
class EventData {
  @JsonKey(name: "Title")
  final String title;
  @JsonKey(name: "Thumbnail")
  final String thumbnail;
  @JsonKey(name: "Link")
  final String link;
  @JsonKey(name: "StartDate")
  final DateTime startDate;
  @JsonKey(name: "EndDate")
  final DateTime endDate;
  @JsonKey(name: "RewardDate")
  final DateTime? rewardDate;

  EventData({
    required this.title,
    required this.thumbnail,
    required this.link,
    required this.startDate,
    required this.endDate,
    this.rewardDate,
  });

  factory EventData.fromJson(Map<String, dynamic> json) =>
      _$EventDataFromJson(json);
  Map<String, dynamic> toJson() => _$EventDataToJson(this);
}
