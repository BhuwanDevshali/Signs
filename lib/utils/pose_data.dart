// lib/utils/pose_data.dart

import 'package:flutter_app/models/pose.dart';

class PoseData {
  static List<Pose> poses = [
    Pose(
      id: 1,
      name: 'A',
      keypoints: [/* keypoints for pose A */],
    ),
    Pose(
      id: 2,
      name: 'B',
      keypoints: [/* keypoints for pose B */],
    ),
    // Add more poses as per American Sign Language
  ];
}