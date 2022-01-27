import 'package:dio/dio.dart';
import 'package:flutter_mvvm/di/module/local_module.dart';
import 'package:flutter_mvvm/di/module/network_module.dart';
import 'package:flutter_mvvm/network/dio_client.dart';
import 'package:flutter_mvvm/network/repositories/post_login_repository.dart';
import 'package:flutter_mvvm/sharedpref/shared_prefrenses.dart';
import 'package:flutter_mvvm/stores/error_store.dart';
import 'package:flutter_mvvm/stores/theme_store.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/repositories/pre_login_repository.dart';
import '../../ui/screens/detailed_screen_store.dart';
import '../../ui/screens/home_screen_view_store.dart';
import '../../ui/screens/more_details_view_store.dart';
import '../../ui/screens/splash_screen_store.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  //Errors

  getIt.registerFactory(() => ErrorStore());

  //async call
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  //singleton
  getIt.registerSingleton(
      SharedPreferencesHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetWorkModule.provideDioClient(getIt.get<SharedPreferencesHelper>()));
  getIt.registerSingleton<DioClient>(DioClient(getIt.get<Dio>()));

  //Repository
  getIt.registerSingleton(PreLoginRepository(
      getIt.get<DioClient>(), getIt.get<SharedPreferencesHelper>()));
  getIt.registerSingleton(PostLoginRepository(
      getIt.get<DioClient>(), getIt.get<SharedPreferencesHelper>()));

  //Stores
  getIt.registerSingleton(ThemeStore());
  getIt
      .registerSingleton(HomeScreenViewStore(getIt.get<PostLoginRepository>()));
  getIt
      .registerSingleton(DetailedScreenStore(getIt.get<PostLoginRepository>()));
  getIt.registerSingleton(
      SplashScreenViewStore(getIt.get<PreLoginRepository>()));
  getIt.registerSingleton(
      MoreDetailsViewStore(getIt.get<PostLoginRepository>()));
}
