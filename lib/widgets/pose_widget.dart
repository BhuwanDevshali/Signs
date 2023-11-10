import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pose.dart';
import '../services/pose_detection_service.dart';

class PoseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PoseDetectionService>(
      builder: (context, poseDetectionService, child) {
        Pose pose = poseDetectionService.currentPose;
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Detected Pose',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              pose != null
                  ? Image.asset('assets/images/${pose.name}.png')
                  : Text('No pose detected'),
              SizedBox(height: 10),
              pose != null
                  ? Text(
                      'Pose: ${pose.name}',
                      style: TextStyle(fontSize: 18),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}