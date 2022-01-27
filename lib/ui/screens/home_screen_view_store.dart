import 'package:flutter_mvvm/network/repositories/post_login_repository.dart';
import 'package:mobx/mobx.dart';

import '../../models/news/news_list_model.dart';
import '../../models/news/results.dart';

part 'home_screen_view_store.g.dart';

class HomeScreenViewStore = _HomeScreenViewStore with _$HomeScreenViewStore;

abstract class _HomeScreenViewStore with Store {
  late final PostLoginRepository _postLoginRepository;

  _HomeScreenViewStore(this._postLoginRepository) {
    reaction((_) => isIconSearch, (_) => {doSearch("")}, fireImmediately: true);
  }

  List<Results> copy = List.empty(growable: true);

  @observable
  ObservableList<Results>? items;

  @observable
  bool isIconSearch = true;

  static ObservableFuture<NewsListModel?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<NewsListModel?> fetchNewsFuture =
      ObservableFuture(emptyPostResponse);

  @computed
  bool get loading => fetchNewsFuture.status == FutureStatus.pending;

  @action
  doSearch(String text) {
    items?.clear();
    if (text.isEmpty) {
      items?.addAll(copy);
    } else {
      var where = copy.where((element) =>
          element.title?.toLowerCase().contains(text.toLowerCase()) ?? false);
      items?.addAll(where);
    }
  }

  @action
  Future getNewsList() async {
    final allNewsList = _postLoginRepository.getAllNewsList();
    fetchNewsFuture = ObservableFuture(allNewsList);
    allNewsList
        .then((newsList) => {
              items = ObservableList<Results>.of(
                  newsList.results ?? List.empty(growable: true)),
              copy.addAll(newsList.results ?? List.empty(growable: true))
            })
        .catchError((e) {});
  }
}
