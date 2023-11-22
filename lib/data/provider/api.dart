import 'package:auction/data/model/character_summary_models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/news_models.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://developer-lostark.game.onstove.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/news/notices")
  Future<List<NoticeData>> getNotices(@Header("authorization") String key);

  @GET("/news/events")
  Future<List<EventData>> getEvents(@Header("authorization") String key);

  @GET("/armories/characters/{characterName}/profiles")
  Future<CharacterSummaryData> getProfileSummary(
      @Header("authorization") String key,
      @Path("characterName") String characterName);
}
