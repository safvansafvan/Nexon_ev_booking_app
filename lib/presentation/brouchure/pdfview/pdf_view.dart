import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({super.key, required this.pdf});

  final String pdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SfPdfViewer.asset(
          pdf,
        ),
      ),
    );
  }
}
