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
  final RxBool _isEtc = false.obs;
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

  final RxList<List<DropDownData>?> _etcOptions = <List<DropDownData>>[].obs;
  final RxList<DropDownData> _selectedOption = <DropDownData>[].obs;
  final RxList<List<DropDownData>?> _etcOptionsSubs =
      <List<DropDownData>>[].obs;
  final RxList<DropDownData> _selectedOptionSub = <DropDownData>[].obs;

  final RxList<TextEditingController> _slotMinList = [
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: "")
  ].obs;

  final RxList<TextEditingController> _slotMaxList = [
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: "")
  ].obs;

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
    _isSkills.value = ((selectedClass?.title ?? "전체") != "전체" &&
            (_selectedCategory!.value.code <= 190050 &&
                _selectedCategory!.value.code >= 170300) ||
        _selectedCategory!.value.code == 10000 ||
        _selectedCategory!.value.code == 210000);
    _isAccessories.value = (_selectedCategory!.value.code >= 200000 &&
        _selectedCategory!.value.code <= 200040);
    _isEtc.value = (_selectedCategory!.value.code >= 200000 &&
            _selectedCategory!.value.code <= 200040) ||
        _selectedCategory!.value.code == 30000;
    if (!_isAccessories.value) {
      setCurrentQuality(_qualityList!.first);
    }

    if (_isSkills.value) {
      setSkillsOptions();
    }

    if (_isEtc.value) {
      setEtcOptions();
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
            (_selectedCategory!.value.code <= 190050 &&
                _selectedCategory!.value.code >= 170300) ||
        _selectedCategory!.value.code == 10000 ||
        _selectedCategory!.value.code == 210000);
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

  setEtcOptions() {
    _etcOptions.clear();
    _etcOptionsSubs.clear();
    _selectedOption.clear();
    _selectedOptionSub.clear();
    for (int i = 0; i < 5; i++) {
      _etcOptions.add([DropDownData("없음", null, null)].obs);
      _etcOptionsSubs.add([DropDownData("없음", null, null)].obs);
    }
    for (EtcOption e in response.etcOptions) {
      for (int i = 0; i < _etcOptions.length; i++) {
        _etcOptions[i]!.add(DropDownData(e.content, e.value, null));
      }
    }
    for (int i = 0; i < 5; i++) {
      _selectedOption.add(_etcOptions[i]!.first);
      _selectedOptionSub.add(_etcOptionsSubs[i]!.first);
    }
  }

  setCurrentEtcOptions(DropDownData cur, int idx) {
    _selectedOption[idx] = cur;
    for (EtcOption e in response.etcOptions) {
      if (e.value == cur.code) {
        for (EtcSub s in e.etcSubs) {
          _etcOptionsSubs[idx]!.add(DropDownData(s.content, s.value, null));
        }
      }
    }
  }

  setCurrentEtcSubOptions(DropDownData cur, int idx) {
    _selectedOptionSub[idx] = cur;
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
    _isSkills.value = !_isSkills.value;
    _isSkills.value = !_isSkills.value;
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

  List<List<DropDownData>?> get etcOptions => _etcOptions;
  List<List<DropDownData>?> get etcOptionsSubs => _etcOptionsSubs;
  List<DropDownData?> get selectedOption => _selectedOption;
  List<DropDownData?> get selectedOptionSub => _selectedOptionSub;

  TextEditingController get firstSkill => _firstSkill.value;

  TextEditingController get secondSkill => _secondSkill.value;

  TextEditingController get itemName => _itemName.value;

  TextEditingController get itemMaxLv => _itemMaxLv.value;

  TextEditingController get itemMinLv => _itemMinLv.value;

  List<TextEditingController> get slotMinList => _slotMinList;

  List<TextEditingController> get slotMaxList => _slotMaxList;

  bool get isSkills => _isSkills.value;

  bool get isAccessories => _isAccessories.value;

  bool get isEtc => _isEtc.value;

  bool get isLoaded => _isLoaded.value;
}
