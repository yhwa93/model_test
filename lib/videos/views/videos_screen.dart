import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model_test/videos/view_models/video_config_vm.dart';
import 'package:model_test/videos/widget/videos_post.dart';

class VideosScreen extends ConsumerWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: const Text("Muted : "),
            subtitle: const Text("뮤트 기능입니다."),
            // value: context.watch<VideoConfigViewModel>().muted, 
            value: ref.watch(videoConfigProvider).muted,
            onChanged: (value) {
              ref.read(videoConfigProvider.notifier).setMuted(value);
            },
            // onChanged:(value) => context.read<VideoConfigViewModel>().setMuted(value),
          ),
          SwitchListTile.adaptive(
            title: const Text("Autoplay: "),
            subtitle: const Text("오토 플레이 기능입니다."),
            // value: context.watch<VideoConfigViewModel>().autoplay, 
            value: ref.watch(videoConfigProvider).autoplay,
            onChanged: (value) {
              ref.read(videoConfigProvider.notifier).setAutoplay(value);
            },
            // onChanged:(value) => context.read<VideoConfigViewModel>().setAutoplay(value),
          ),
          const SizedBox(
            height: 20,
          ),
          const VideoPost(),
        ],
      ),
    );
  }
}