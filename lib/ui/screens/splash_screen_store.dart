import 'package:flutter_mvvm/network/repositories/pre_login_repository.dart';
import 'package:mobx/mobx.dart';

part 'splash_screen_store.g.dart';

class SplashScreenViewStore = _SplashScreenViewStore with _$SplashScreenViewStore;

abstract class _SplashScreenViewStore with Store {
  late PreLoginRepository _preLoginRepository;

  _SplashScreenViewStore(this._preLoginRepository);
}
