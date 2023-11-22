// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_summary_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterSummaryData _$CharacterSummaryDataFromJson(
        Map<String, dynamic> json) =>
    CharacterSummaryData(
      characterImage: json['CharacterImage'] as String,
      expeditionLevel: json['ExpeditionLevel'] as int,
      pvpGradeName: json['PvpGradeName'] as String,
      townLevel: json['TownLevel'] as int,
      townName: json['TownName'] as String,
      title: json['Title'] as String?,
      guildName: json['GuildName'] as String?,
      serverName: json['ServerName'] as String,
      characterName: json['CharacterName'] as String,
      characterLevel: json['CharacterLevel'] as int,
      characterClassName: json['CharacterClassName'] as String,
      itemAvgLevel: json['ItemAvgLevel'] as String,
    );

Map<String, dynamic> _$CharacterSummaryDataToJson(
        CharacterSummaryData instance) =>
    <String, dynamic>{
      'CharacterImage': instance.characterImage,
      'ExpeditionLevel': instance.expeditionLevel,
      'PvpGradeName': instance.pvpGradeName,
      'TownLevel': instance.townLevel,
      'TownName': instance.townName,
      'Title': instance.title,
      'GuildName': instance.guildName,
      'ServerName': instance.serverName,
      'CharacterName': instance.characterName,
      'CharacterLevel': instance.characterLevel,
      'CharacterClassName': instance.characterClassName,
      'ItemAvgLevel': instance.itemAvgLevel,
    };
