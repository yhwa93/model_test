import 'package:flutter/material.dart';
import 'package:model_test/videos/repos/video_config_repogitory.dart';
import 'package:model_test/videos/view_models/video_config_vm.dart';
import 'package:model_test/videos/views/videos_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  
  //Repogitroy를 initialize -> ViewModel을 초기화
  final preferences = await SharedPreferences.getInstance();
  final repository = VideoConfigRepogitory(preferences);
  
  runApp(MultiProvider(
    providers: [
      
      //하위 위젯에 ChangeNotifier를 제공해주는 클래스
      ChangeNotifierProvider(
        create: (context) => VideoConfigViewModel(repository),
      ),
    ], 
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: VideosScreen(),
        ),
      ),
    );
  }
}