import 'package:flutter/material.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart';
import 'example_base.dart';
import 'show_pdf.dart';

class DocumentTextDetectionFilePage extends ExampleBase {
  static const assetName = 'assets/allswell.pdf';

  const DocumentTextDetectionFilePage({
    super.key,
    required super.googleVision,
    required super.title,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: getAppBar(context),
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
                      googleVision: googleVision,
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
