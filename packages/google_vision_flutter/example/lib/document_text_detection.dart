import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';

class DocumentTextDetection extends StatefulWidget {
  const DocumentTextDetection({super.key, required this.title});

  final String title;

  @override
  State<DocumentTextDetection> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DocumentTextDetection> {
  final _processImage = Image.asset(
    'assets/census2010.jpg',
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
                  child: Text('assets/census2010.jpg'),
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
                  child: GoogleVisionBuilder.documentTextDetection(
                    googleVision: GoogleVision.withAsset(
                        'assets/service_credentials.json'),
                    imageProvider: _processImage.image,
                    builder: (
                      BuildContext context,
                      FullTextAnnotation? fullTextAnnotation,
                    ) =>
                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          children: fullTextAnnotation!.pages
                              .map((page) => Center(
                                    child: Text(
                                      'Page Language - ${page.property?.detectedLanguages?.first.languageCode ?? ''}',
                                    ),
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
