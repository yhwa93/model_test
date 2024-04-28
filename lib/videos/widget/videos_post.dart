import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:model_test/videos/view_models/timeline_view_model.dart';
import 'package:model_test/videos/view_models/video_config_vm.dart';

class VideoPost extends ConsumerStatefulWidget {
  const VideoPost({super.key});

  @override
  VideoPostScreenState createState() => VideoPostScreenState();
}

class VideoPostScreenState extends ConsumerState<VideoPost> {

  void _onTapVolume(){
    final muted = ref.read(videoConfigProvider).muted;
    ref.read(videoConfigProvider.notifier).setMuted(!muted);
  }

  void _onTapAutoPlay(){
    final autoplay = ref.read(videoConfigProvider).autoplay;
    ref.read(videoConfigProvider.notifier).setAutoplay(!autoplay);
  }

  void _onUploadPressed(){
    ref.read(timelineProvider.notifier).uploadVideo();
  }

  @override
  Widget build(BuildContext context, ) {
    return  Column(
      children: [
         Row(
          children: [
            const Text("업로드하기 ===>", style: TextStyle(fontSize: 30,),),
            IconButton(
              icon: ref.watch(timelineProvider).isLoading ? const CircularProgressIndicator() : const FaIcon(FontAwesomeIcons.upload),
              onPressed: ref.watch(timelineProvider).isLoading ? (){} : _onUploadPressed, 
            ),
          ],
        ),
        const SizedBox(height: 30,),
        IconButton(
           icon: FaIcon(
            // context.watch<VideoConfigViewModel>().muted ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeOff,
            ref.watch(videoConfigProvider).muted ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeOff,
            size: 60,
          ),
          onPressed: _onTapVolume,
          // onPressed:() {
          //   // context
          //   //   .read<VideoConfigViewModel>()
          //   //   .setMuted(!context.read<VideoConfigViewModel>().muted);
          // }, 
        ),
        IconButton(
           icon: FaIcon(
            // context.watch<VideoConfigViewModel>().autoplay ? FontAwesomeIcons.rotate : FontAwesomeIcons.rotateLeft,
            ref.watch(videoConfigProvider).autoplay ? FontAwesomeIcons.rotate : FontAwesomeIcons.rotateLeft, 
            size: 60,
          ),
          onPressed: _onTapAutoPlay,
          // onPressed:() {
          //   // context
          //   //   .read<VideoConfigViewModel>()
          //   //   .setAutoplay(!context.read<VideoConfigViewModel>().autoplay);
          // }, 
        ),
      ],
    );
  }
}