import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../models/property_sale_model.dart';
import '../services/api_services.dart';

class PropertyPdfProvider extends ChangeNotifier {
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

  // MAIN METHOD
  Future<void> generatePropertyPdf(PropertySaleContract contract) async {
    _isLoading = true;
    _error = null;
    _pdfBytes = null;
    notifyListeners();

    try {
      final response = await ApiService().propertyPdf(contract);

      if (response.success && response.data != null) {
        _pdfBytes = response.data as Uint8List;
      } else {
        _error = response.message ?? "PDF generation failed";
      }
    } catch (e) {
      _error = "Something went wrong: $e";
    }

    _isLoading = false;
    notifyListeners();
  }
}
