import 'package:json_annotation/json_annotation.dart';
part 'siblings_models.g.dart';

@JsonSerializable()
class SiblingsData {
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
  @JsonKey(name: "ItemMaxLevel")
  final String itemMaxLevel;

  SiblingsData(
      {required this.serverName,
      required this.characterName,
      required this.characterLevel,
      required this.characterClassName,
      required this.itemAvgLevel,
      required this.itemMaxLevel});

  factory SiblingsData.fromJson(Map<String, dynamic> json) =>
      _$SiblingsDataFromJson(json);
  Map<String, dynamic> toJson() => _$SiblingsDataToJson(this);
}
