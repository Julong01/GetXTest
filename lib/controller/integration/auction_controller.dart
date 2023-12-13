import 'package:auction/data/model/auctions_models.dart';
import 'package:auction/data/repository/auctions_repository.dart';
import 'package:auction/util/util_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/local/drop_down_model.dart';

class AuctionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AuctionsRepository repository;

  AuctionController({required this.repository});

  final RxBool _isSkills = false.obs;
  final RxBool _isAccessories = false.obs;
  final RxBool _isLoaded = false.obs;

  late final AuctionOptionResponse response;
  List<DropDownData>? _categoryList;
  Rx<DropDownData>? _selectedCategory;
  List<DropDownData>? _classList;
  Rx<DropDownData>? _selectedClass;
  List<DropDownData>? _gradeList;
  Rx<DropDownData>? _selectedGrade;
  List<DropDownData>? _qualityList;
  Rx<DropDownData>? _selectedQuality;
  List<DropDownData>? _itemTierList;
  Rx<DropDownData>? _selectedItemTier;
  List<DropDownData>? _firstSkillOption;
  Rx<DropDownData>? _selectedFirst;
  List<DropDownData>? _firstSkillTripod;
  Rx<DropDownData>? _selectedFirstTri;
  List<DropDownData>? _secondSkillOption;
  Rx<DropDownData>? _selectedSecond;
  List<DropDownData>? _secondSkillTripod;
  Rx<DropDownData>? _selectedSecondTri;
  final Rx<TextEditingController> _firstSkill =
      TextEditingController(text: "").obs;
  final Rx<TextEditingController> _secondSkill =
      TextEditingController(text: "").obs;
  final Rx<TextEditingController> _itemName =
      TextEditingController(text: "").obs;
  final Rx<TextEditingController> _itemMinLv =
      TextEditingController(text: "0").obs;
  final Rx<TextEditingController> _itemMaxLv =
      TextEditingController(text: "").obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOptions();
  }

  getOptions() async {
    response = await repository.getAuctionsOptions();
    setCategories();
    setClasses();
    setGrades();
    setQualities();
    setItemTiers();
    _itemMaxLv.value.text = response.maxItemLevel.toString();
    _isLoaded.value = true;
  }

  setCategories() {
    _categoryList = [];
    for (Category c in response.categories) {
      _categoryList!.add(DropDownData(c.codeName, c.code, null));
      if (c.subs.isNotEmpty) {
        for (CategoryItem i in c.subs) {
          _categoryList!.add(DropDownData(i.codeName, i.code, null));
        }
      }
    }
    _selectedCategory = _categoryList!.first.obs;
  }

  setCurrentCategory(DropDownData cur) {
    _selectedCategory!.value = cur;
    _isSkills.value = ((_selectedCategory!.value.code >= 170300 &&
            (selectedClass?.title ?? "전체") != "전체" &&
            _selectedCategory!.value.code <= 190050) ||
        _selectedCategory!.value.code == 10000 ||
        _selectedCategory!.value.code == 210000);
    _isAccessories.value = (_selectedCategory!.value.code >= 200000 &&
        _selectedCategory!.value.code <= 200040);

    if (!_isAccessories.value) {
      setCurrentQuality(_qualityList!.first);
    }

    if (_isSkills.value) {
      setSkillsOptions();
    }
  }

  setClasses() {
    _classList = [];
    _classList!.add(DropDownData("전체", "", null));
    for (String className in response.classes) {
      _classList!.add(DropDownData(className, className, null));
    }
    _selectedClass = _classList!.first.obs;
  }

  setCurrentClass(DropDownData cur) {
    _selectedClass!.value = cur;
    _isSkills.value = false;
    _isSkills.value = ((selectedClass?.title ?? "전체") != "전체" &&
        (_selectedCategory!.value.code <= 190050 ||
            _selectedCategory!.value.code == 10000 ||
            _selectedCategory!.value.code == 210000 ||
            _selectedCategory!.value.code >= 170300));
    setSkillsOptions();
  }

  setGrades() {
    _gradeList = [];
    _gradeList!.add(DropDownData("전체", "", Util.gradeColor("")));
    for (String grade in response.itemGrades) {
      _gradeList!.add(DropDownData(grade, grade, Util.gradeColor(grade)));
    }
    _selectedGrade = _gradeList!.first.obs;
  }

  setCurrentGrade(DropDownData cur) {
    _selectedGrade!.value = cur;
  }

  setQualities() {
    _qualityList = [];
    _qualityList!.add(DropDownData("전체", null, Util.qualityColor(-1)));
    for (int quality in response.itemGradeQualities) {
      _qualityList!.add(DropDownData(
          quality.toString(), quality, Util.qualityColor(quality)));
    }
    _selectedQuality = _qualityList!.first.obs;
  }

  setCurrentQuality(DropDownData cur) {
    _selectedQuality!.value = cur;
  }

  setItemTiers() {
    _itemTierList = [];
    _itemTierList!.add(DropDownData("전체", null, null));
    for (int tier in response.itemTiers) {
      _itemTierList!.add(DropDownData("$tier 티어", tier, null));
    }
    _selectedItemTier = _itemTierList!.first.obs;
  }

  setCurrentItemTier(DropDownData cur) {
    _selectedItemTier!.value = cur;
  }

  setSkillsOptions() {
    _firstSkillOption = [DropDownData("없음", null, null)].obs;
    _secondSkillOption = [DropDownData("없음", null, null)].obs;
    _firstSkillTripod = [];
    _firstSkillTripod!.add(DropDownData("없음", null, null));
    _secondSkillTripod = [];
    _secondSkillTripod!.add(DropDownData("없음", null, null));

    if (selectedClass != null) {
      for (SkillOption skill in response.skillOptions) {
        if (skill.className == selectedClass!.title) {
          _firstSkillOption!
              .add(DropDownData(skill.content, skill.value, null));
          _secondSkillOption!
              .add(DropDownData(skill.content, skill.value, null));
        }
      }
    }
    _selectedFirst = _firstSkillOption!.first.obs;
    _selectedSecond = _secondSkillOption!.first.obs;
    _selectedFirstTri = _firstSkillTripod!.first.obs;
    _selectedSecondTri = _secondSkillTripod!.first.obs;
  }

  setCurrentFirstSkill(DropDownData cur) {
    _selectedFirst!.value = cur;
    _firstSkillTripod = [];
    _firstSkillTripod!.add(DropDownData("없음", null, null));
    for (SkillOption skill in response.skillOptions) {
      if (skill.value == cur.code) {
        for (Tripod tri in skill.tripods) {
          if (_selectedCategory!.value.title != "보석") {
            if (!tri.isGem) {
              _firstSkillTripod!
                  .add(DropDownData(tri.content, tri.value, null));
            }
          } else {
            if (tri.isGem) {
              _firstSkillTripod!
                  .add(DropDownData(tri.content, tri.value, null));
            }
          }
        }
      }
    }
    _selectedFirstTri = _firstSkillTripod!.first.obs;
  }

  setCurrentSecondSkill(DropDownData cur) {
    _selectedSecond!.value = cur;
    _secondSkillTripod = [];
    _secondSkillTripod!.add(DropDownData("없음", null, null));
    for (SkillOption skill in response.skillOptions) {
      if (skill.value == cur.code) {
        for (Tripod tri in skill.tripods) {
          if (_selectedCategory!.value.title != "보석") {
            if (!tri.isGem) {
              _secondSkillTripod!
                  .add(DropDownData(tri.content, tri.value, null));
            }
          } else {
            if (tri.isGem) {
              _secondSkillTripod!
                  .add(DropDownData(tri.content, tri.value, null));
            }
          }
        }
      }
    }
    _selectedSecondTri = _secondSkillTripod!.first.obs;
  }

  setCurrentFirstTri(DropDownData cur) {
    _selectedFirstTri!.value = cur;
  }

  setCurrentSecondTri(DropDownData cur) {
    _selectedSecondTri!.value = cur;
  }

  validatorMinValue() {
    if (_itemMinLv.value.text.contains(RegExp(r"[.,-]"))) {
      return false;
    }
    if (_itemMinLv.value.text.isEmpty ||
        int.parse(_itemMinLv.value.text) > int.parse(_itemMaxLv.value.text)) {
      return false;
    }
    return true;
  }

  validatorMaxValue() {
    if (_itemMaxLv.value.text.contains(RegExp(r"[.,-]"))) {
      return false;
    }
    if (_itemMaxLv.value.text.isEmpty ||
        int.parse(_itemMinLv.value.text) > int.parse(_itemMaxLv.value.text)) {
      return false;
    }
    return true;
  }

  late AnimationController dialController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  isDialBtnClosed() {
    isDialOpen.value = false;
    dialController.reverse();
  }

  isDialBtnClicked() {
    isDialOpen.value = true;
    dialController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _itemName.close();
    _itemMinLv.close();
    _itemMaxLv.close();
    dialController.dispose();
    super.dispose();
  }

  List<DropDownData>? get categories => _categoryList;

  DropDownData? get selectedCategory => _selectedCategory!.value;

  List<DropDownData>? get classList => _classList;

  DropDownData? get selectedClass => _selectedClass!.value;

  List<DropDownData>? get gradeList => _gradeList;

  DropDownData? get selectedGrade => _selectedGrade!.value;

  List<DropDownData>? get qualityList => _qualityList;

  DropDownData? get selectedQuality => _selectedQuality!.value;

  List<DropDownData>? get itemTierList => _itemTierList;

  DropDownData? get selectedItemTier => _selectedItemTier!.value;

  List<DropDownData>? get firstSkillOption => _firstSkillOption;

  DropDownData? get selectedFirst => _selectedFirst?.value;

  List<DropDownData>? get secondSkillOption => _secondSkillOption;

  DropDownData? get selectedSecond => _selectedSecond?.value;

  List<DropDownData>? get firstSkillsTri => _firstSkillTripod;

  DropDownData? get selectedFirstTri => _selectedFirstTri?.value;

  List<DropDownData>? get secondSkillsTri => _secondSkillTripod;

  DropDownData? get selectedSecondTri => _selectedSecondTri?.value;

  TextEditingController get firstSkill => _firstSkill.value;

  TextEditingController get secondSkill => _secondSkill.value;

  TextEditingController get itemName => _itemName.value;

  TextEditingController get itemMaxLv => _itemMaxLv.value;

  TextEditingController get itemMinLv => _itemMinLv.value;

  bool get isSkills => _isSkills.value;

  bool get isAccessories => _isAccessories.value;

  bool get isLoaded => _isLoaded.value;
}
