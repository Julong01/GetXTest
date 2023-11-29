// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auctions_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuctionOptionResponse _$AuctionOptionResponseFromJson(
        Map<String, dynamic> json) =>
    AuctionOptionResponse(
      maxItemLevel: json['MaxItemLevel'] as int,
      itemGradeQualities: (json['ItemGradeQualities'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      skillOptions: (json['SkillOptions'] as List<dynamic>)
          .map((e) => SkillOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      etcOptions: (json['EtcOptions'] as List<dynamic>)
          .map((e) => EtcOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['Categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemGrades: (json['ItemGrades'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      itemTiers:
          (json['ItemTiers'] as List<dynamic>).map((e) => e as int).toList(),
      classes:
          (json['Classes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AuctionOptionResponseToJson(
        AuctionOptionResponse instance) =>
    <String, dynamic>{
      'MaxItemLevel': instance.maxItemLevel,
      'ItemGradeQualities': instance.itemGradeQualities,
      'SkillOptions': instance.skillOptions,
      'EtcOptions': instance.etcOptions,
      'Categories': instance.categories,
      'ItemGrades': instance.itemGrades,
      'ItemTiers': instance.itemTiers,
      'Classes': instance.classes,
    };

SkillOption _$SkillOptionFromJson(Map<String, dynamic> json) => SkillOption(
      value: json['Value'] as int,
      className: json['Class'] as String,
      content: json['Text'] as String,
      isSKillGroup: json['IsSkillGroup'] as bool,
      tripods: (json['Tripods'] as List<dynamic>)
          .map((e) => Tripod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SkillOptionToJson(SkillOption instance) =>
    <String, dynamic>{
      'Value': instance.value,
      'Class': instance.className,
      'Text': instance.content,
      'IsSKillGroup': instance.isSKillGroup,
      'Tripods': instance.tripods,
    };

Tripod _$TripodFromJson(Map<String, dynamic> json) => Tripod(
      value: json['Value'] as int,
      content: json['Text'] as String,
      isGem: json['IsGem'] as bool,
    );

Map<String, dynamic> _$TripodToJson(Tripod instance) => <String, dynamic>{
      'Value': instance.value,
      'Text': instance.content,
      'IsGem': instance.isGem,
    };

EtcOption _$EtcOptionFromJson(Map<String, dynamic> json) => EtcOption(
      value: json['Value'] as int,
      content: json['Text'] as String,
      etcSubs: (json['EtcSubs'] as List<dynamic>)
          .map((e) => EtcSub.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EtcOptionToJson(EtcOption instance) => <String, dynamic>{
      'Value': instance.value,
      'Text': instance.content,
      'EtcSubs': instance.etcSubs,
    };

EtcSub _$EtcSubFromJson(Map<String, dynamic> json) => EtcSub(
      value: json['Value'] as int,
      content: json['Text'] as String,
      className: json['Class'] as String,
    );

Map<String, dynamic> _$EtcSubToJson(EtcSub instance) => <String, dynamic>{
      'Value': instance.value,
      'Text': instance.content,
      'Class': instance.className,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      subs: (json['Subs'] as List<dynamic>)
          .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['Code'] as int,
      codeName: json['CodeName'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'Subs': instance.subs,
      'Code': instance.code,
      'CodeName': instance.codeName,
    };

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) => CategoryItem(
      code: json['Code'] as int,
      codeName: json['CodeName'] as String,
    );

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'CodeName': instance.codeName,
    };
