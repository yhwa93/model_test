import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model_test/videos/models/video_model.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  List<VideoModel> _list = [
    VideoModel(title: "First Video"),
  ];

  Future<void> uploadVideo() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 3));
    final newVideo = VideoModel(title: "${DateTime.now()}");
    _list = [..._list, newVideo];
    state = AsyncValue.data(_list);
  }

  //Firebase로부터 어떤 것들을 가져와서 그 리스트를 반환
  @override
  FutureOr<List<VideoModel>> build() async {
    await Future.delayed(const Duration(seconds: 3));
    // throw Exception("OMG!!! 나 fetch 못함 ㅠㅠ");
    return _list;
  }
}

//Async Provider
final timelineProvider = AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
