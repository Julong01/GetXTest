// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siblings_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiblingsData _$SiblingsDataFromJson(Map<String, dynamic> json) => SiblingsData(
      serverName: json['ServerName'] as String,
      characterName: json['CharacterName'] as String,
      characterLevel: json['CharacterLevel'] as int,
      characterClassName: json['CharacterClassName'] as String,
      itemAvgLevel: json['ItemAvgLevel'] as String,
      itemMaxLevel: json['ItemMaxLevel'] as String,
    );

Map<String, dynamic> _$SiblingsDataToJson(SiblingsData instance) =>
    <String, dynamic>{
      'ServerName': instance.serverName,
      'CharacterName': instance.characterName,
      'CharacterLevel': instance.characterLevel,
      'CharacterClassName': instance.characterClassName,
      'ItemAvgLevel': instance.itemAvgLevel,
      'ItemMaxLevel': instance.itemMaxLevel,
    };
