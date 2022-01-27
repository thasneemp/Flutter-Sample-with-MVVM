import 'package:flutter_mvvm/models/news/news_list_model.dart';
import 'package:flutter_mvvm/network/dio_client.dart';
import 'package:flutter_mvvm/network/repository.dart';
import 'package:flutter_mvvm/sharedpref/shared_prefrenses.dart';

class PostLoginRepository extends BaseRepository {
  PostLoginRepository(DioClient handler, SharedPreferencesHelper helper)
      : super(handler, helper);

  /// To retrieve news list
  Future<NewsListModel> getAllNewsList() async {
    return handler.getNewsList();
  }
}
