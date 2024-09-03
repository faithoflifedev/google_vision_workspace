import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

abstract class ExampleBase extends StatelessWidget {
  const ExampleBase({
    super.key,
    required this.googleVision,
    required this.title,
  });

  final FutureOr<GoogleVision> googleVision;

  final String title;

  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(title),
      );

  Widget simpleColumn({
    required assetName,
    required Image sampleImage,
    required Widget result,
  }) =>
      SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(assetName),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: sampleImage,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Processed image will appear below:',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: result,
                ),
              )
            ],
          ),
        ),
      );
}
