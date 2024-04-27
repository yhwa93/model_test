import 'package:shared_preferences/shared_preferences.dart';

class VideoConfigRepogitory {

  //레포지토리 키값
  static const String _autoplay = "autoplay";
  static const String _muted = "muted";

  //SharedPreference : 기기 내부 디스크에 데이터를 저장하는 기능
  final SharedPreferences _preferences;

  //Contructor에 SharedPreference 넣기
  VideoConfigRepogitory(this._preferences);

  //저장 SETTER Method
  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  Future<void> setAutoplay(bool value) async {
    _preferences.setBool(_autoplay, value);
  }

  //읽기 GETTER Method
  bool isMuted(){
    return _preferences.getBool(_muted) ?? false;
  }

  bool isAutoplay(){
    return _preferences.getBool(_autoplay) ?? false;
  }
}