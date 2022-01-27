import 'package:flutter_mvvm/network/repositories/post_login_repository.dart';
import 'package:mobx/mobx.dart';

part 'more_details_view_store.g.dart';

class MoreDetailsViewStore = _MoreDetailsViewStore with _$MoreDetailsViewStore;

abstract class _MoreDetailsViewStore with Store {
  late PostLoginRepository _postLoginRepository;

  _MoreDetailsViewStore(this._postLoginRepository);
}
