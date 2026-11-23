import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:printing/printing.dart';
import 'package:skelter/presentation/checkout/widgets/invoice_preview_app_bar.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

@RoutePage()
class InvoicePreviewScreen extends StatelessWidget {
  final Uint8List pdfBytes;
  final String fileName;

  const InvoicePreviewScreen({
    required this.pdfBytes,
    required this.fileName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InvoicePreviewAppBar(pdfBytes: pdfBytes, fileName: fileName),
      body: InvoicePreviewBody(pdfBytes: pdfBytes),
    );
  }
}

class InvoicePreviewBody extends StatelessWidget {
  final Uint8List pdfBytes;

  const InvoicePreviewBody({required this.pdfBytes, super.key});

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => pdfBytes,
      allowPrinting: false,
      allowSharing: false,
      canChangePageFormat: false,
      canChangeOrientation: false,
      canDebug: false,
      scrollViewDecoration: const BoxDecoration(color: AppColors.white),
      pdfPreviewPageDecoration: const BoxDecoration(color: AppColors.white),
      previewPageMargin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
    );
  }
}
