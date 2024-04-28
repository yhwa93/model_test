import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:model_test/videos/view_models/video_config_vm.dart';

class VideoPostScreen extends ConsumerStatefulWidget {
  const VideoPostScreen({super.key});

  @override
  VideoPostScreenState createState() => VideoPostScreenState();
}

class VideoPostScreenState extends ConsumerState<VideoPostScreen> {

  void _onTapVolume(){
    final muted = ref.read(videoConfigProvider).muted;
    ref.read(videoConfigProvider.notifier).setMuted(!muted);
  }

  void _onTapAutoPlay(){
    final autoplay = ref.read(videoConfigProvider).autoplay;
    ref.read(videoConfigProvider.notifier).setAutoplay(!autoplay);
  }

  @override
  Widget build(BuildContext context, ) {
    return  Column(
      children: [
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