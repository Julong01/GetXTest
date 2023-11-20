import 'package:auction/data/repository/news_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final NewsRepository repository;
  HomeController({required this.repository});
}
