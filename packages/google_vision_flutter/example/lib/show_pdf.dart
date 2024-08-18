import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ShowPdf extends StatefulWidget {
  const ShowPdf({super.key, required this.assetName});

  final String assetName;

  @override
  State<ShowPdf> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ShowPdf> {
  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
        body: SfPdfViewer.asset(widget.assetName),
      ));
}
