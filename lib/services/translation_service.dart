import 'dart:async';
import 'package:tflite/tflite.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../utils/constants.dart';
import '../models/translation.dart';

class TranslationService {
  static Future<String> loadModel() async {
    try {
      final appDir = await getTemporaryDirectory();
      final modelPath = '${appDir.path}/$TRANSLATION_MODEL_PATH';
      final data = await rootBundle.load('assets/models/$TRANSLATION_MODEL_PATH');
      final file = await File(modelPath).writeAsBytes(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      );
      return await Tflite.loadModel(
        model: file.path,
        labels: 'assets/models/labels.txt',
        numThreads: 1,
      );
    } catch (e) {
      print('Failed to load model: $e');
      return null;
    }
  }

  static Future<Translation> translatePose(int poseId) async {
    final result = await Tflite.runModelOnImage(
      path: 'assets/images/$poseId.png',
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 1,
      threshold: 0.2,
      asynch: true,
    );
    if (result.isEmpty) {
      return null;
    }
    return Translation(
      id: result[0]['index'],
      poseId: poseId,
      text: result[0]['label'],
    );
  }
}