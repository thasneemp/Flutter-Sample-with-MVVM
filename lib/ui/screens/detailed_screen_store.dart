import 'package:flutter_mvvm/network/repositories/post_login_repository.dart';
import 'package:mobx/mobx.dart';

part 'detailed_screen_store.g.dart';

class DetailedScreenStore = _DetailedScreenStore with _$DetailedScreenStore;
abstract class _DetailedScreenStore with Store {
  late PostLoginRepository _postLoginRepository;

  _DetailedScreenStore(this._postLoginRepository);
}
