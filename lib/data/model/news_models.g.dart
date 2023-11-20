// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice_Response _$Notice_ResponseFromJson(Map<String, dynamic> json) =>
    Notice_Response(
      data: (json['data'] as List<dynamic>)
          .map((e) => Notice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Notice_ResponseToJson(Notice_Response instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Notice _$NoticeFromJson(Map<String, dynamic> json) => Notice(
      title: json['Title'] as String,
      date: DateTime.parse(json['Date'] as String),
      link: json['Link'] as String,
      type: json['Type'] as String,
    );

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'Title': instance.title,
      'Date': instance.date.toIso8601String(),
      'Link': instance.link,
      'Type': instance.type,
    };

Events_Response _$Events_ResponseFromJson(Map<String, dynamic> json) =>
    Events_Response(
      data: (json['data'] as List<dynamic>)
          .map((e) => Events.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Events_ResponseToJson(Events_Response instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
      title: json['Title'] as String,
      thumbnail: json['Thumbnail'] as String,
      link: json['Link'] as String,
      startDate: DateTime.parse(json['StartDate'] as String),
      endDate: DateTime.parse(json['EndDate'] as String),
      rewardDate: json['RewardDate'] == null
          ? null
          : DateTime.parse(json['RewardDate'] as String),
    );

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
      'Title': instance.title,
      'Thumbnail': instance.thumbnail,
      'Link': instance.link,
      'StartDate': instance.startDate.toIso8601String(),
      'EndDate': instance.endDate.toIso8601String(),
      'RewardDate': instance.rewardDate?.toIso8601String(),
    };
