import 'package:json_annotation/json_annotation.dart';

part 'character_summary_models.g.dart';

@JsonSerializable()
class CharacterSummaryData {
  @JsonKey(name: "CharacterImage")
  final String characterImage;
  @JsonKey(name: "ExpeditionLevel")
  final int expeditionLevel;
  @JsonKey(name: "PvpGradeName")
  final String pvpGradeName;
  @JsonKey(name: "TownLevel")
  final int townLevel;
  @JsonKey(name: "TownName")
  final String townName;
  @JsonKey(name: "Title")
  final String? title;
  @JsonKey(name: "GuildName")
  final String? guildName;
  @JsonKey(name: "ServerName")
  final String serverName;
  @JsonKey(name: "CharacterName")
  final String characterName;
  @JsonKey(name: "CharacterLevel")
  final int characterLevel;
  @JsonKey(name: "CharacterClassName")
  final String characterClassName;
  @JsonKey(name: "ItemAvgLevel")
  final String itemAvgLevel;

  CharacterSummaryData(
      {required this.characterImage,
      required this.expeditionLevel,
      required this.pvpGradeName,
      required this.townLevel,
      required this.townName,
      this.title,
      this.guildName,
      required this.serverName,
      required this.characterName,
      required this.characterLevel,
      required this.characterClassName,
      required this.itemAvgLevel});

  factory CharacterSummaryData.fromJson(Map<String, dynamic> json) =>
      _$CharacterSummaryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterSummaryDataToJson(this);
}
