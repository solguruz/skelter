import 'dart:io';
import 'dart:typed_data';

import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/checkout/model/invoice_model.dart';

class PdfService {
  static Future<Uint8List> generateInvoicePdf(
    InvoiceModel invoice,
    AppLocalizations localization,
  ) async {
    final pdf = pw.Document();
    final interRegular = await PdfGoogleFonts.interRegular();
    final interMedium = await PdfGoogleFonts.interMedium();
    final interBold = await PdfGoogleFonts.interBold();
    final interSemiBold = await PdfGoogleFonts.interSemiBold();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(16),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Text(
                localization.invoice,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontSize: 24,
                  font: interBold,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 24),
              _buildInvoiceAndBillToCard(
                invoice,
                localization,
                interRegular,
                interSemiBold,
                interMedium,
              ),
              pw.SizedBox(height: 24),
              _buildProductTableCard(invoice, localization, interMedium),
              pw.SizedBox(height: 24),
              _buildTotalsCard(
                invoice,
                localization,
                interRegular,
                interSemiBold,
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _buildInvoiceAndBillToCard(
    InvoiceModel invoice,
    AppLocalizations localization,
    pw.Font interRegular,
    pw.Font interSemiBold,
    pw.Font interMedium,
  ) {
    final dateFormat = DateFormat('MMM dd, yyyy');

    return pw.Container(
      padding: const pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        color: PdfColors.white,
        borderRadius: pw.BorderRadius.circular(12),
        border: pw.Border.all(color: const PdfColor.fromInt(0xFFE1E4EA)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            localization.invoice_details,
            style: pw.TextStyle(
              fontSize: 18,
              font: interSemiBold,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 16),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    localization.invoice_number,
                    style: pw.TextStyle(
                      fontSize: 14,
                      font: interRegular,
                      color: PdfColors.grey600,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    '#${invoice.invoiceNumber}',
                    style: pw.TextStyle(
                      fontSize: 18,
                      font: interMedium,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    localization.invoice_date,
                    style: pw.TextStyle(
                      fontSize: 14,
                      font: interRegular,
                      color: PdfColors.grey600,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    dateFormat.format(invoice.invoiceDate),
                    style: pw.TextStyle(
                      fontSize: 18,
                      font: interMedium,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 24),
          pw.Divider(height: 1, color: PdfColors.grey300),
          pw.SizedBox(height: 24),
          pw.Text(
            localization.bill_to,
            style: pw.TextStyle(
              fontSize: 18,
              font: interSemiBold,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 16),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    localization.name,
                    style: pw.TextStyle(
                      fontSize: 14,
                      font: interRegular,
                      color: PdfColors.grey600,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    invoice.customerName,
                    style: pw.TextStyle(
                      fontSize: 18,
                      font: interRegular,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    localization.payment_method,
                    style: pw.TextStyle(
                      fontSize: 14,
                      font: interRegular,
                      color: PdfColors.grey600,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    invoice.paymentMethod,
                    style: pw.TextStyle(
                      fontSize: 18,
                      font: interRegular,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 16),
          pw.Text(
            localization.address,
            style: pw.TextStyle(
              fontSize: 14,
              font: interRegular,
              color: PdfColors.grey600,
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            invoice.shippingAddress,
            style: pw.TextStyle(
              fontSize: 18,
              font: interRegular,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildProductTableCard(
    InvoiceModel invoice,
    AppLocalizations localization,
    pw.Font interMedium,
  ) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        color: PdfColors.white,
        borderRadius: pw.BorderRadius.circular(12),
        border: pw.Border.all(color: const PdfColor.fromInt(0xFFE1E4EA)),
      ),
      child: pw.ClipRRect(
        horizontalRadius: 12,
        verticalRadius: 12,
        child: pw.Table(
          border: pw.TableBorder.symmetric(
            inside: const pw.BorderSide(color: PdfColor.fromInt(0xFFE1E4EA)),
            outside: const pw.BorderSide(color: PdfColor.fromInt(0xFFE1E4EA)),
          ),
          columnWidths: {
            0: const pw.FlexColumnWidth(3),
            1: const pw.FlexColumnWidth(),
            2: const pw.FlexColumnWidth(),
            3: const pw.FlexColumnWidth(),
          },
          children: [
            pw.TableRow(
              decoration: const pw.BoxDecoration(
                color: PdfColor.fromInt(0xFFF5F7FA),
              ),
              children: [
                _buildTableHeaderCell(
                  localization.product,
                  pw.TextAlign.left,
                  interMedium,
                ),
                _buildTableHeaderCell(
                  localization.quantity,
                  pw.TextAlign.center,
                  interMedium,
                ),
                _buildTableHeaderCell(
                  localization.price,
                  pw.TextAlign.center,
                  interMedium,
                ),
                _buildTableHeaderCell(
                  localization.total,
                  pw.TextAlign.right,
                  interMedium,
                ),
              ],
            ),
            ...invoice.items.map((item) {
              final itemTotal = item.product.price * item.quantities;
              return pw.TableRow(
                children: [
                  _buildTableCell(
                    item.product.title,
                    pw.TextAlign.left,
                    interMedium,
                  ),
                  _buildTableCell(
                    '${item.quantities}',
                    pw.TextAlign.center,
                    interMedium,
                  ),
                  _buildTableCell(
                    '\$${item.product.price}',
                    pw.TextAlign.center,
                    interMedium,
                  ),
                  _buildTableCell(
                    '\$$itemTotal',
                    pw.TextAlign.right,
                    interMedium,
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  static pw.Widget _buildTableHeaderCell(
    String text,
    pw.TextAlign align,
    pw.Font font,
  ) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: pw.Text(
        text,
        textAlign: align,
        style: pw.TextStyle(fontSize: 14, font: font, color: PdfColors.grey600),
      ),
    );
  }

  static pw.Widget _buildTableCell(
    String text,
    pw.TextAlign align,
    pw.Font regularFont,
  ) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: pw.Text(
        text,
        textAlign: align,
        style: pw.TextStyle(
          fontSize: 14,
          font: regularFont,
          fontWeight: pw.FontWeight.normal,
        ),
      ),
    );
  }

  static pw.Widget _buildTotalsCard(
    InvoiceModel invoice,
    AppLocalizations localization,
    pw.Font interRegular,
    pw.Font interSemiBold,
  ) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        color: PdfColors.white,
        borderRadius: pw.BorderRadius.circular(12),
        border: pw.Border.all(color: const PdfColor.fromInt(0xFFE1E4EA)),
      ),
      child: pw.Column(
        children: [
          _buildTotalRow(
            localization.subtotal,
            invoice.subtotal,
            interRegular,
            interSemiBold,
          ),
          pw.SizedBox(height: 12),
          _buildTotalRow(
            localization.discount,
            -invoice.discount,
            interRegular,
            interSemiBold,
            isDiscount: true,
          ),
          pw.SizedBox(height: 12),
          _buildTotalRow(
            localization.delivery_charges,
            invoice.deliveryCharges,
            interRegular,
            interSemiBold,
          ),
          pw.SizedBox(height: 16),
          pw.Divider(height: 1, color: PdfColors.grey300),
          pw.SizedBox(height: 16),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                localization.total_amount,
                style: pw.TextStyle(
                  fontSize: 18,
                  font: interSemiBold,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                '\$${invoice.totalAmount}',
                style: pw.TextStyle(
                  fontSize: 18,
                  font: interSemiBold,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildTotalRow(
    String label,
    double amount,
    pw.Font regularFont,
    pw.Font boldFont, {
    bool isDiscount = false,
  }) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            fontSize: 16,
            font: regularFont,
            color: PdfColors.grey600,
          ),
        ),
        pw.Text(
          isDiscount
              ? '-\$${amount.abs().toStringAsFixed(2)}'
              : '\$${amount.toStringAsFixed(2)}',
          style: pw.TextStyle(
            fontSize: 16,
            font: boldFont,
            fontWeight: pw.FontWeight.normal,
            color: isDiscount ? PdfColors.green600 : PdfColors.black,
          ),
        ),
      ],
    );
  }

  /// Shares the PDF file using the system share dialog.
  /// This is the only way to export the invoice as saving to device
  /// has issues on Android where files end up in app-specific storage
  /// that users cannot easily access.
  static Future<void> sharePdf(
    Uint8List pdfBytes,
    String fileName,
    Rect sharePositionOrigin,
  ) async {
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);
    await file.writeAsBytes(pdfBytes);

    // share_plus requires iPad users to provide the
    // sharePositionOrigin parameter.
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(filePath)],
        subject: 'Invoice - $fileName',
        sharePositionOrigin: sharePositionOrigin,
      ),
    );
  }
}
