import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../models/moveble_lease.dart';
import '../services/api_services.dart';

class MovablePdfProvider extends ChangeNotifier {
  bool isLoading = false;
  Uint8List? pdfBytes;
  String? errorMessage;

  /// Generate Movable Lease PDF
  Future<void> generatePdf(CraneContractModel request) async {
    isLoading = true;
    errorMessage = null;
    pdfBytes = null;
    notifyListeners();

    try {
      ApiResponse response =
      await ApiService().moveblePdf(request);

      if (response.success) {
        pdfBytes = response.data; // 👈 PDF bytes
      } else {
        errorMessage = response.message ?? "PDF generation failed";
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  /// Clear PDF data
  void clear() {
    pdfBytes = null;
    errorMessage = null;
    notifyListeners();
  }
}
