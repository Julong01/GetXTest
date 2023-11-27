import 'package:auction/data/repository/character_repository.dart';
import 'package:get/get.dart';

import 'package:auction/data/model/z_models.dart';

class InfoController extends GetxController {
  final CharacterRepository repository;
  InfoController({required this.repository});
  List<CharacterSummaryData> _list = [];
  late final List<SiblingsData> _siblings;

  @override
  onInit() {
    _siblings = Get.arguments["siblings"];
    getSummaries();
    super.onInit();
  }

  Future<void> getSummaries() async {
    List<CharacterSummaryData> temp = [];
    for (SiblingsData s in _siblings) {
      print(s.characterName);
      CharacterSummaryData data =
          await repository.getProfileSummary(s.characterName);
      temp.add(data);
    }
    _list = temp;
    update();
  }

  List<CharacterSummaryData> get list => _list;
}
