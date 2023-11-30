import 'package:auction/data/model/auctions_models.dart';
import 'package:auction/data/repository/autions_repository.dart';
import 'package:auction/util/util_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DropDownData {
  String title;
  dynamic code;
  Color? titleColor;
  DropDownData(this.title, this.code, this.titleColor);

  static enable() => DropDownData("dummy", 100000001, null);

  @override
  String toString() {
    // TODO: implement toString
    return title;
  }
}

class AuctionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AuctionsRepository repository;

  AuctionController({required this.repository});

  final RxBool _isSkills = true.obs;
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

  final Rx<TextEditingController> _itemName =
      TextEditingController(text: "").obs;
  final Rx<TextEditingController> _itemMinLv =
      TextEditingController(text: "0").obs;
  final Rx<TextEditingController> _itemMaxLv =
      TextEditingController(text: "").obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getOptions();
    super.onInit();
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
            _selectedCategory!.value.code <= 190050) ||
        _selectedCategory!.value.code == 10000 ||
        _selectedCategory!.value.code == 210000);
    _isAccessories.value = (_selectedCategory!.value.code >= 200000 &&
        _selectedCategory!.value.code <= 200040);

    if (!_isAccessories.value) {
      setCurrentQuality(_qualityList!.first);
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

  late AnimationController dialController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  isDialBtnClosed() {
    isDialOpen.value = false;
    _isSkills.value = true;
    dialController.reverse();
  }

  isDialBtnClicked() {
    isDialOpen.value = true;
    _isSkills.value = false;
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

  TextEditingController get itemName => _itemName.value;
  TextEditingController get itemMaxLv => _itemMaxLv.value;
  TextEditingController get itemMinLv => _itemMinLv.value;
  bool get isSkills => _isSkills.value;
  bool get isAccessories => _isAccessories.value;
  bool get isLoaded => _isLoaded.value;
}
