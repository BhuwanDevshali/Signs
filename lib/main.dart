import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'services/pose_detection_service.dart';
import 'services/translation_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PoseDetectionService(),
        ),
        ChangeNotifierProvider(
          create: (_) => TranslationService(),
        ),
      ],
      child: ASLTranslationApp(),
    ),
  );
}