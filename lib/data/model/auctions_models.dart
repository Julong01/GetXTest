import 'package:json_annotation/json_annotation.dart';

part 'auctions_models.g.dart';

@JsonSerializable()
class AuctionOptionResponse {
  @JsonKey(name: "MaxItemLevel")
  final int maxItemLevel;
  @JsonKey(name: "ItemGradeQualities")
  final List<int> itemGradeQualities;
  @JsonKey(name: "SkillOptions")
  final List<SkillOption> skillOptions;
  @JsonKey(name: "EtcOptions")
  final List<EtcOption> etcOptions;
  @JsonKey(name: "Categories")
  final List<Category> categories;
  @JsonKey(name: "ItemGrades")
  final List<String> itemGrades;
  @JsonKey(name: "ItemTiers")
  final List<int> itemTiers;
  @JsonKey(name: "Classes")
  final List<String> classes;
  AuctionOptionResponse(
      {required this.maxItemLevel,
      required this.itemGradeQualities,
      required this.skillOptions,
      required this.etcOptions,
      required this.categories,
      required this.itemGrades,
      required this.itemTiers,
      required this.classes});

  factory AuctionOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$AuctionOptionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuctionOptionResponseToJson(this);
}

@JsonSerializable()
class SkillOption {
  @JsonKey(name: "Value")
  final int value;
  @JsonKey(name: "Class")
  final String className;
  @JsonKey(name: "Text")
  final String content;
  @JsonKey(name: "IsSkillGroup")
  final bool isSKillGroup;
  @JsonKey(name: "Tripods")
  final List<Tripod> tripods;
  SkillOption(
      {required this.value,
      required this.className,
      required this.content,
      required this.isSKillGroup,
      required this.tripods});

  factory SkillOption.fromJson(Map<String, dynamic> json) =>
      _$SkillOptionFromJson(json);
  Map<String, dynamic> toJson() => _$SkillOptionToJson(this);
}

@JsonSerializable()
class Tripod {
  @JsonKey(name: "Value")
  final int value;
  @JsonKey(name: "Text")
  final String content;
  @JsonKey(name: "IsGem")
  final bool isGem;
  Tripod({required this.value, required this.content, required this.isGem});

  factory Tripod.fromJson(Map<String, dynamic> json) => _$TripodFromJson(json);
  Map<String, dynamic> toJson() => _$TripodToJson(this);
}

@JsonSerializable()
class EtcOption {
  @JsonKey(name: "Value")
  final int value;
  @JsonKey(name: "Text")
  final String content;
  @JsonKey(name: "EtcSubs")
  final List<EtcSub> etcSubs;
  EtcOption(
      {required this.value, required this.content, required this.etcSubs});

  factory EtcOption.fromJson(Map<String, dynamic> json) =>
      _$EtcOptionFromJson(json);
  Map<String, dynamic> toJson() => _$EtcOptionToJson(this);
}

@JsonSerializable()
class EtcSub {
  @JsonKey(name: "Value")
  final int value;
  @JsonKey(name: "Text")
  final String content;
  @JsonKey(name: "Class")
  final String className;
  EtcSub({required this.value, required this.content, required this.className});

  factory EtcSub.fromJson(Map<String, dynamic> json) => _$EtcSubFromJson(json);
  Map<String, dynamic> toJson() => _$EtcSubToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "Subs")
  final List<CategoryItem> subs;
  @JsonKey(name: "Code")
  final int code;
  @JsonKey(name: "CodeName")
  final String codeName;
  Category({required this.subs, required this.code, required this.codeName});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CategoryItem {
  @JsonKey(name: "Code")
  final int code;
  @JsonKey(name: "CodeName")
  final String codeName;
  CategoryItem({required this.code, required this.codeName});

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}
