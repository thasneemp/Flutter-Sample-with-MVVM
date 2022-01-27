import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/news/news_list_model.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: "http://api.nytimes.com/svc/mostpopular/v2")
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  @GET("/mostviewed/all-sections/7.json?api-key=Ld0AF7Vw0WXoTL5oGQSYPJGlb8PSrYrN")
  Future<NewsListModel> getNewsList();
}
