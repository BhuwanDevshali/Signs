import 'package:flutter/material.dart';
import '../models/translation.dart';

class TranslationData {
  static List<Translation> translations = [
    Translation(
      id: 1,
      poseId: 1,
      text: 'Hello',
    ),
    Translation(
      id: 2,
      poseId: 2,
      text: 'Goodbye',
    ),
    Translation(
      id: 3,
      poseId: 3,
      text: 'Yes',
    ),
    Translation(
      id: 4,
      poseId: 4,
      text: 'No',
    ),
    // Add more translations as per the American Sign Language (ASL)
  ];
}