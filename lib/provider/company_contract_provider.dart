import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../models/company_contract.dart';
import '../services/api_services.dart';

class CompanyContractPdfProvider extends ChangeNotifier {
  bool _isLoading = false;
  Uint8List? _pdfBytes;
  String? _error;

  // GETTERS
  bool get isLoading => _isLoading;
  Uint8List? get pdfBytes => _pdfBytes;
  String? get error => _error;

  // CLEAR STATE
  void clear() {
    _pdfBytes = null;
    _error = null;
    notifyListeners();
  }

  // MAIN METHOD (MATCHES companyPdf API)
  Future<void> generateCompanyPdf(
      CompanyContractModel contract,
      ) async {
    _isLoading = true;
    _error = null;
    _pdfBytes = null;
    notifyListeners();

    try {
      final response = await ApiService().companyPdf(contract);

      if (response.success && response.data != null) {
        _pdfBytes = response.data as Uint8List;
      } else {
        _error = response.message ?? "Failed to generate PDF";
      }
    } catch (e) {
      _error = "Something went wrong: $e";
    }

    _isLoading = false;
    notifyListeners();
  }
}
