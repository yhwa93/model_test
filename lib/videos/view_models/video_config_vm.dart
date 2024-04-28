import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model_test/videos/models/video_config_model.dart';
import 'package:model_test/videos/repos/video_config_repogitory.dart';

class VideoConfigViewModel extends Notifier<VideoConfigModel> {

  //Repogitory(로컬 저장소) 접근
  final VideoConfigRepogitory _repogitory;

  //Model(모델: 데이터 선언) 접근
  // late final VideoConfigModel _model = VideoConfigModel(
  //   muted: _repogitory.isMuted(), 
  //   autoplay: _repogitory.isAutoplay(),
  // );

  //Contructor
  VideoConfigViewModel(this._repogitory);

  //GETTER 화면에서 접근
  // bool get muted => _model.muted;
  // bool get autoplay => _model.autoplay;

  //SETTER 화면에서 접근
  void setMuted(bool value){
    _repogitory.setMuted(value);

    //Provider: Model을 다시 만듦
    state = VideoConfigModel(
      muted: value, 
      autoplay: state.autoplay,
    );

    // state.muted = value;
    // _model.muted = value;
    // notifyListeners();
  }

  //state를 아예 새로 만들어서 데이터를 수정
  void setAutoplay(bool value){
    _repogitory.setAutoplay(value);

    state = VideoConfigModel(
      muted: state.muted, 
      autoplay: value,
    );

    // state.autoplay = value;
    // _model.autoplay = value;
    // notifyListeners();
  }
  
  //build 메서드로 데이터의 초기값을 반환
  //Notifier가 노출할 데이터를 제공하는 방식
  @override
  VideoConfigModel build() {

    //초기화
    return VideoConfigModel(
    muted: _repogitory.isMuted(), 
    autoplay: _repogitory.isAutoplay(),
  );
  }
}

//===> Riverpod : Provider
//ViewModel의 데이터의 변화를 통지 
//그렇게 하여 노출될 데이터는 Model임
final videoConfigProvider = 
  NotifierProvider<VideoConfigViewModel, VideoConfigModel>(
  () => throw UnimplementedError(),
);