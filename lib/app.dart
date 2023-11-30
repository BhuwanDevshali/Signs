import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/splash_screen.dart';
import 'services/pose_detection_service.dart';
import 'services/translation_service.dart';
import 'utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PoseDetectionService()),
        ChangeNotifierProvider(create: (_) => TranslationService()),
      ],
      child: MaterialApp(
        title: APP_TITLE,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}