import 'package:flutter/material.dart';
import 'package:model_test/videos/models/video_config_model.dart';
import 'package:model_test/videos/repos/video_config_repogitory.dart';

class VideoConfigViewModel extends ChangeNotifier {

  //Repogitory(로컬 저장소) 접근
  final VideoConfigRepogitory _repogitory;

  //Model(모델: 데이터 선언) 접근
  late final VideoConfigModel _model = VideoConfigModel(
    muted: _repogitory.isMuted(), 
    autoplay: _repogitory.isAutoplay(),
  );

  //Contructor
  VideoConfigViewModel(this._repogitory);

  //GETTER 화면에서 접근
  bool get muted => _model.muted;
  bool get autoplay => _model.autoplay;

  //SETTER 화면에서 접근
  void setMuted(bool value){
    _repogitory.setMuted(value);
    _model.muted = value;
    notifyListeners();
  }

  void setAutoplay(bool value){
    _repogitory.setAutoplay(value);
    _model.autoplay = value;
    notifyListeners();
  }
}