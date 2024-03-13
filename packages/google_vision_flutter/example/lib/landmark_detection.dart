import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

class LandmarkDetection extends StatefulWidget {
  const LandmarkDetection({super.key, required this.title});

  final String title;

  @override
  State<LandmarkDetection> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LandmarkDetection> {
  final _processImage = Image.asset(
    'assets/cn_tower.jpg',
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
                  child: Text('assets/cn_tower.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _processImage,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Processed result will appear below:',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GoogleVisionBuilder.landmarkDetection(
                    googleVision: GoogleVision.withAsset(
                        'assets/service_credentials.json'),
                    imageProvider: _processImage.image,
                    builder: (BuildContext context,
                            List<EntityAnnotation>? entityAnnotations,
                            ImageDetail imageDetail) =>
                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: entityAnnotations!
                            .map((landmark) => Row(
                                  children: [
                                    Text('${landmark.score} - '),
                                    Text(landmark.description),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
