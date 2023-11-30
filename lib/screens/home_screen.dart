import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/pose_detection_service.dart';
import '../services/translation_service.dart';
import '../widgets/pose_widget.dart';
import '../widgets/translation_widget.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_TITLE),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<PoseDetectionService>(
              builder: (context, poseService, child) {
                return PoseWidget(pose: poseService.currentPose);
              },
            ),
          ),
          Expanded(
            child: Consumer<TranslationService>(
              builder: (context, translationService, child) {
                return TranslationWidget(translation: translationService.currentTranslation);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/scan');
        },
        child: Icon(Icons.camera),
        tooltip: 'Scan',
      ),
    );
  }
}