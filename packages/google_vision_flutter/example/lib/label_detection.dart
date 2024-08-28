import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

class LabelDetection extends StatefulWidget {
  const LabelDetection({super.key, required this.title});

  final String title;

  @override
  State<LabelDetection> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LabelDetection> {
  final _processImage = Image.asset(
    'assets/setagaya_small.jpg',
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('assets/setagaya_small.jpg'),
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
                    child: GoogleVisionBuilder.labelDetection(
                      googleVision: GoogleVision.withAsset(
                          'assets/service_credentials.json'),
                      imageProvider: _processImage.image,
                      builder: (
                        BuildContext context,
                        List<EntityAnnotation>? entityAnnotations,
                      ) =>
                          Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            children: entityAnnotations!
                                .map((entity) => Text(
                                    '${(entity.score! * 100).toStringAsFixed(2)}% - ${entity.description}'))
                                .toList()),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
