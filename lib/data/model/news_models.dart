import 'package:json_annotation/json_annotation.dart';

part 'news_models.g.dart';

@JsonSerializable()
class Notice_Response {
  List<Notice> data;

  Notice_Response({required this.data});

  factory Notice_Response.fromJson(Map<String, dynamic> json) =>
      _$Notice_ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$Notice_ResponseToJson(this);
}

@JsonSerializable()
class Notice {
  @JsonKey(name: "Title")
  final String title;
  @JsonKey(name: "Date")
  final DateTime date;
  @JsonKey(name: "Link")
  final String link;
  @JsonKey(name: "Type")
  final String type;

  Notice(
      {required this.title,
      required this.date,
      required this.link,
      required this.type});

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}

@JsonSerializable()
class Events_Response {
  List<Events> data;

  Events_Response({required this.data});

  factory Events_Response.fromJson(Map<String, dynamic> json) =>
      _$Events_ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$Events_ResponseToJson(this);
}

@JsonSerializable()
class Events {
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

  Events({
    required this.title,
    required this.thumbnail,
    required this.link,
    required this.startDate,
    required this.endDate,
    this.rewardDate,
  });

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);
  Map<String, dynamic> toJson() => _$EventsToJson(this);
}
