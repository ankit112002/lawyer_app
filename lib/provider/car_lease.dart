import 'package:flutter/material.dart';

import '../models/request_model.dart';
import '../services/api_services.dart';
 // jahan pdfData function hai

class CarLeasePdfProvider extends ChangeNotifier {
  bool _isLoading = false;
  ApiResponse? _response;

  bool get isLoading => _isLoading;
  ApiResponse? get response => _response;

  /// 🔹 Generate PDF
  Future<ApiResponse> generatePdf(CarLeasePdfRequest request) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await ApiService().pdfData(request);

      _response = result;
      return result;
    } catch (e) {
      final errorResponse = ApiResponse(
        success: false,
        data: null,
        message: e.toString(),
        statusCode: 0,
      );

      _response = errorResponse;
      return errorResponse;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// 🔹 Reset state (optional)
  void clear() {
    _response = null;
    notifyListeners();
  }
}
