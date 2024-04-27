import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:model_test/videos/view_models/video_config_vm.dart';
import 'package:provider/provider.dart';

class VideoPostScreen extends StatefulWidget {
  const VideoPostScreen({super.key});

  @override
  State<VideoPostScreen> createState() => _VideoPostScreenState();
}

class _VideoPostScreenState extends State<VideoPostScreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        IconButton(
           icon:  FaIcon(
            context.watch<VideoConfigViewModel>().muted ? FontAwesomeIcons.volumeHigh : FontAwesomeIcons.volumeOff,
            size: 60,
          ),
          onPressed:() {
            context
              .read<VideoConfigViewModel>()
              .setMuted(!context.read<VideoConfigViewModel>().muted);
          }, 
        ),
        IconButton(
           icon:  FaIcon(
            context.watch<VideoConfigViewModel>().autoplay ? FontAwesomeIcons.rotate : FontAwesomeIcons.rotateLeft, 
            size: 60,
          ),
          onPressed:() {
            context
              .read<VideoConfigViewModel>()
              .setAutoplay(!context.read<VideoConfigViewModel>().autoplay);
          }, 
        ),
      ],
    );
  }
}