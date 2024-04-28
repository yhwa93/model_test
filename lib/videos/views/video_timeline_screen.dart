import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model_test/videos/view_models/timeline_view_model.dart';
import 'package:model_test/videos/widget/videos_post.dart';

class VideoTimeLineScreen extends ConsumerStatefulWidget {
  const VideoTimeLineScreen({super.key});

  @override
  VideoTimeLineScreenState createState() => VideoTimeLineScreenState();
}

class VideoTimeLineScreenState extends ConsumerState<VideoTimeLineScreen> {

  Future<void> _onRefresh (){
    return Future.delayed(
      const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(timelineProvider).when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('$error',
          style: const TextStyle(
          color: Colors.red,
        ),
        ),
      ),
      data:(videos) => RefreshIndicator(
        onRefresh: _onRefresh,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder:(context, index) => const VideoPost()
        ), 
      ),
    );
  }
}