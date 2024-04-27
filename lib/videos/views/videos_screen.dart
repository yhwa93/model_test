import 'package:flutter/material.dart';
import 'package:model_test/videos/view_models/video_config_vm.dart';
import 'package:model_test/videos/widget/videos_post.dart';
import 'package:provider/provider.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: const Text("Muted : "),
            subtitle: const Text("뮤트 기능입니다."),
            value: context.watch<VideoConfigViewModel>().muted, 
            onChanged:(value) => context.read<VideoConfigViewModel>().setMuted(value),
          ),
          SwitchListTile.adaptive(
            title: const Text("Autoplay: "),
            subtitle: const Text("오토 플레이 기능입니다."),
            value: context.watch<VideoConfigViewModel>().autoplay, 
            onChanged:(value) => context.read<VideoConfigViewModel>().setAutoplay(value),
          ),
          const SizedBox(
            height: 20,
          ),
          const VideoPostScreen(),
        ],
      ),
    );
  }
}