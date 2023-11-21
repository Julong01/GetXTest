// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeData _$NoticeDataFromJson(Map<String, dynamic> json) => NoticeData(
      title: json['Title'] as String,
      date: DateTime.parse(json['Date'] as String),
      link: json['Link'] as String,
      type: json['Type'] as String,
    );

Map<String, dynamic> _$NoticeDataToJson(NoticeData instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Date': instance.date.toIso8601String(),
      'Link': instance.link,
      'Type': instance.type,
    };

EventData _$EventDataFromJson(Map<String, dynamic> json) => EventData(
      title: json['Title'] as String,
      thumbnail: json['Thumbnail'] as String,
      link: json['Link'] as String,
      startDate: DateTime.parse(json['StartDate'] as String),
      endDate: DateTime.parse(json['EndDate'] as String),
      rewardDate: json['RewardDate'] == null
          ? null
          : DateTime.parse(json['RewardDate'] as String),
    );

Map<String, dynamic> _$EventDataToJson(EventData instance) => <String, dynamic>{
      'Title': instance.title,
      'Thumbnail': instance.thumbnail,
      'Link': instance.link,
      'StartDate': instance.startDate.toIso8601String(),
      'EndDate': instance.endDate.toIso8601String(),
      'RewardDate': instance.rewardDate?.toIso8601String(),
    };
