// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeScreenViewStore on _HomeScreenViewStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_HomeScreenViewStore.loading'))
      .value;

  final _$itemsAtom = Atom(name: '_HomeScreenViewStore.items');

  @override
  ObservableList<Results>? get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Results>? value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$isIconSearchAtom = Atom(name: '_HomeScreenViewStore.isIconSearch');

  @override
  bool get isIconSearch {
    _$isIconSearchAtom.reportRead();
    return super.isIconSearch;
  }

  @override
  set isIconSearch(bool value) {
    _$isIconSearchAtom.reportWrite(value, super.isIconSearch, () {
      super.isIconSearch = value;
    });
  }

  final _$fetchNewsFutureAtom =
      Atom(name: '_HomeScreenViewStore.fetchNewsFuture');

  @override
  ObservableFuture<NewsListModel?> get fetchNewsFuture {
    _$fetchNewsFutureAtom.reportRead();
    return super.fetchNewsFuture;
  }

  @override
  set fetchNewsFuture(ObservableFuture<NewsListModel?> value) {
    _$fetchNewsFutureAtom.reportWrite(value, super.fetchNewsFuture, () {
      super.fetchNewsFuture = value;
    });
  }

  final _$getNewsListAsyncAction =
      AsyncAction('_HomeScreenViewStore.getNewsList');

  @override
  Future<dynamic> getNewsList() {
    return _$getNewsListAsyncAction.run(() => super.getNewsList());
  }

  final _$_HomeScreenViewStoreActionController =
      ActionController(name: '_HomeScreenViewStore');

  @override
  dynamic doSearch(String text) {
    final _$actionInfo = _$_HomeScreenViewStoreActionController.startAction(
        name: '_HomeScreenViewStore.doSearch');
    try {
      return super.doSearch(text);
    } finally {
      _$_HomeScreenViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
isIconSearch: ${isIconSearch},
fetchNewsFuture: ${fetchNewsFuture},
loading: ${loading}
    ''';
  }
}
