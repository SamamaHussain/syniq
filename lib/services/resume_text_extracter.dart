import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:docx_to_text/docx_to_text.dart';

class ResumeTextExtractor {
  static Future<String> extractText(File file) async {
    final extension = file.path.split('.').last.toLowerCase();

    try {
      switch (extension) {
        case 'pdf':
          final bytes = await file.readAsBytes();
          final document = PdfDocument(inputBytes: bytes);
          final text = PdfTextExtractor(document).extractText();
          document.dispose();
          return text;

        case 'docx':
          final bytes = await file.readAsBytes();
          return docxToText(bytes);

        case 'txt':
          return await file.readAsString();

        default:
          throw Exception('Unsupported file format: $extension');
      }
    } catch (e) {
      throw Exception('Failed to extract text: $e');
    }
  }
}
