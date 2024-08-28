import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

class CropHints extends StatefulWidget {
  const CropHints({super.key, required this.title});

  final String title;

  @override
  State<CropHints> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CropHints> {
  static const assetName = 'assets/young-man-smiling.jpg';

  final _processImage = Image.asset(
    assetName,
    fit: BoxFit.fitWidth,
  );

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(widget.title),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(assetName),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _processImage,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Process result will appear below:',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GoogleVisionBuilder.cropHints(
                    googleVision: GoogleVision.withAsset(
                        'assets/service_credentials.json'),
                    imageProvider: _processImage.image,
                    builder: (
                      BuildContext context,
                      CropHintsAnnotation? cropHintsAnnotation,
                    ) =>
                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          children: cropHintsAnnotation!.cropHints
                              .map((cropHint) => Center(
                                    child: Text('$cropHint'),
                                  ))
                              .toList()),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
