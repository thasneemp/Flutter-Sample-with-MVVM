import 'package:flutter_mvvm/network/dio_client.dart';
import 'package:flutter_mvvm/sharedpref/shared_prefrenses.dart';

class BaseRepository {
  final SharedPreferencesHelper _helper;
  final DioClient _handler;

  BaseRepository(this._handler, this._helper);

  DioClient get handler => _handler;

  SharedPreferencesHelper get helper => _helper;
}
