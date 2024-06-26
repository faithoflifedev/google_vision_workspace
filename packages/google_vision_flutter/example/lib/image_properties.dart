import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart' as gv;
import 'package:google_vision_flutter/google_vision_flutter.dart';

class ImageProperties extends StatefulWidget {
  const ImageProperties({super.key, required this.title});

  final String title;

  @override
  State<ImageProperties> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ImageProperties> {
  final _processImage = Image.asset(
    'assets/logo.png',
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
                  child: Text('assets/logo.png'),
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
                  child: GoogleVisionBuilder.imageProperties(
                    maxResults: 5,
                    googleVision: GoogleVision.withAsset(
                        'assets/service_credentials.json'),
                    imageProvider: _processImage.image,
                    builder: (
                      BuildContext context,
                      gv.ImagePropertiesAnnotation? imagePropertiesAnnotation,
                      ImageDetail? imageDetail,
                    ) =>
                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        const Text('Dominant Colors:'),
                        ...imagePropertiesAnnotation!.dominantColors.colors
                            .map((colors) => Text('$colors',
                                style: TextStyle(
                                  color: Color.fromRGBO(
                                    colors.color.red.toInt(),
                                    colors.color.green.toInt(),
                                    colors.color.blue.toInt(),
                                    1.0,
                                  ),
                                )))
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
