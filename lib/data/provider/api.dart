import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../model/news_models.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://developer-lostark.game.onstove.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/news/notices")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'Authorization': 'bearer aaaaaa'
  })
  Future<Notice_Response> getNotices();

  @GET("/news/events")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'Authorization': 'bearer aaaaaa'
  })
  Future<Events_Response> getEvents();
}
