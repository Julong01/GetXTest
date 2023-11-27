import 'package:auction/data/model/z_models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://developer-lostark.game.onstove.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @GET("/news/notices")
  Future<List<NoticeData>> getNotices();

  @GET("/news/events")
  Future<List<EventData>> getEvents();

  @GET("/characters/{characterName}/siblings")
  Future<List<SiblingsData>> getSiblings(
      @Path("characterName") String characterName);

  @GET("/armories/characters/{characterName}/profiles")
  Future<CharacterSummaryData> getProfileSummary(
      @Path("characterName") String characterName);
}
