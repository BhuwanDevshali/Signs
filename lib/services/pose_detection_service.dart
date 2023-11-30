import 'dart:async';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pose.dart';
import '../utils/pose_data.dart';
import '../utils/constants.dart';

class PoseDetectionService {
  CameraController _cameraController;
  StreamController<Pose> _poseStreamController = StreamController<Pose>.broadcast();

  Stream<Pose> get poseStream => _poseStreamController.stream;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    await _cameraController.initialize();
  }

  Future<void> startPoseDetection() async {
    await Tflite.loadModel(
      model: POSE_MODEL_PATH,
      labels: 'assets/labels.txt',
    );

    _cameraController.startImageStream((image) async {
      var recognitions = await Tflite.runPoseNetOnFrame(
        bytesList: image.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: image.height,
        imageWidth: image.width,
        numResults: 1,
      );

      if (recognitions.isNotEmpty) {
        var pose = PoseData.getPoseFromKeypoints(recognitions[0]['keypoints']);
        _poseStreamController.add(pose);
      }
    });
  }

  Future<void> stopPoseDetection() async {
    await _cameraController?.stopImageStream();
    await Tflite.close();
  }

  void dispose() {
    _poseStreamController?.close();
    _cameraController?.dispose();
  }
}