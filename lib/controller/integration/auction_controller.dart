import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auction/data/model/auctions_models.dart';
import 'package:auction/data/repository/autions_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DropDownData with CustomDropdownListFilter {
  String title;
  int value;

  DropDownData(this.title, this.value);
  @override
  String toString() {
    // TODO: implement toString
    return title;
  }

  @override
  bool filter(String query) {
    return title.toLowerCase().contains(query.toLowerCase());
  }
}

class AuctionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AuctionsRepository repository;

  AuctionController({required this.repository});

  final RxBool _isSkills = false.obs;
  final RxBool _isLoaded = false.obs;

  late final AuctionOptionResponse response;
  List<DropDownData>? _categoryList;
  DropDownData? _selectedCategory;

  @override
  void onInit() {
    // TODO: implement onInit
    getOptions();
    super.onInit();
  }

  getOptions() async {
    response = await repository.getAuctionsOptions();
    setCategories();
    _isLoaded.value = true;
  }

  setCategories() {
    _categoryList = [];
    _selectedCategory = DropDownData(
        response.categories.first.codeName, response.categories.first.code);
    for (Category c in response.categories) {
      _categoryList!.add(DropDownData(c.codeName, c.code));
      if (c.subs.isNotEmpty) {
        for (CategoryItem i in c.subs) {
          _categoryList!.add(DropDownData(i.codeName, i.code));
        }
      }
    }
  }

  setCurrentCategory(DropDownData cur) {
    _selectedCategory = cur;
    _isSkills.value = ((_selectedCategory!.value >= 170300 &&
            _selectedCategory!.value <= 190050) ||
        _selectedCategory!.value == 10000 ||
        _selectedCategory!.value == 210000);
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
    dialController.dispose();
    super.dispose();
  }

  List<DropDownData>? get categories => _categoryList;
  DropDownData? get selectedCategory => _selectedCategory;
  bool get isSkills => _isSkills.value;
  bool get isLoaded => _isLoaded.value;
}
