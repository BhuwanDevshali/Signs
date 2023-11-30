import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/translation.dart';

class TranslationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Translation>(
      builder: (context, translation, child) {
        return Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Translation',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                translation.text,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}