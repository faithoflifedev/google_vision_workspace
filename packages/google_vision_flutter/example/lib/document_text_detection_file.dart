import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'package:vision_demo/show_pdf.dart';

class DocumentTextDetectionFile extends StatefulWidget {
  const DocumentTextDetectionFile({super.key, required this.title});

  final String title;

  @override
  State<DocumentTextDetectionFile> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DocumentTextDetectionFile> {
  static const assetName = 'assets/allswell.pdf';

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
                  ElevatedButton(
                      child: const Text('Show PDF Content'),
                      onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ShowPdf(assetName: assetName),
                            ),
                          )),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Process result will appear below:',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      assetName,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GoogleVisionFileBuilder.documentTextDetection(
                      googleVision: GoogleVision.withAsset(
                          'assets/service_credentials.json'),
                      inputConfig: InputConfig.fromAsset('assets/allswell.pdf'),
                      builder: (
                        BuildContext context,
                        List<AnnotateFileResponse>? responses,
                      ) =>
                          Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            children: responses!
                                .map(
                                  (annotateFileResponse) => Text(
                                      'Total Pages - ${annotateFileResponse.totalPages}'),
                                )
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
