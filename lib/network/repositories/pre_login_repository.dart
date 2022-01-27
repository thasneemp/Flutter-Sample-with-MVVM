import 'package:flutter_mvvm/network/repository.dart';
import 'package:flutter_mvvm/sharedpref/shared_prefrenses.dart';

import '../dio_client.dart';

class PreLoginRepository extends BaseRepository {
  PreLoginRepository(
      DioClient _handler, SharedPreferencesHelper preferencesHelper)
      : super(_handler, preferencesHelper);
}
