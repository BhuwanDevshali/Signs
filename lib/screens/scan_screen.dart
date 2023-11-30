import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

import '../services/pose_detection_service.dart';
import '../services/translation_service.dart';
import '../widgets/pose_widget.dart';
import '../widgets/translation_widget.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  CameraController _cameraController;
  bool _isDetecting = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _initCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();

    _cameraController.startImageStream((image) {
      if (!_isDetecting) {
        _isDetecting = true;

        Tflite.runPoseNetOnFrame(
          bytesList: image.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: image.height,
          imageWidth: image.width,
          numResults: 1,
        ).then((poses) {
          if (poses.isNotEmpty) {
            Provider.of<PoseDetectionService>(context, listen: false)
                .onPoseDetected(poses[0]);
          }
          _isDetecting = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
      ),
      body: Stack(
        children: <Widget>[
          CameraPreview(_cameraController),
          PoseWidget(),
          TranslationWidget(),
        ],
      ),
    );
  }
}