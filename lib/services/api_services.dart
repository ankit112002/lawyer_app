import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/my_model.dart';
import '../models/request_model.dart';
import '../models/signup.dart';

class ApiService {
  Future<Model?> getdata(String email) async {
    try {
      var url = Uri.parse(
          "https://yehia-api.vkapsprojects.com/create_chat");

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
        }),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      if (response.statusCode == 200) {
        return Model.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }

  Future<dynamic> getQuestion(String email, String chat_id, String question) async {

    try {
      var url = Uri.parse("https://yehia-api.vkapsprojects.com/chatting");

      final payload = {
        "email": email,
        "chat_id": chat_id,
        "question": question
      };

      print("📌 SENDING PAYLOAD: $payload");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload),
      );

      print("📌 STATUS CODE: ${response.statusCode}");
      print("📌 RESPONSE BODY: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;

    } catch (e) {
      print("❌ ERROR: $e");
      return null;
    }
  }


  Future<dynamic> getChatHistory(String email) async {
    try {
      // Encode email for URL
      String encodedEmail = Uri.encodeQueryComponent(email);

      // Build URL with parameter
      var url = Uri.parse(
        "https://yehia-api.vkapsprojects.com/chat?email=$encodedEmail",
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        print("Server Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }

  Future<dynamic> editChatName(String email,String chat_id,String new_chat_name) async{
    try {
      var url = Uri.parse(
          "https://yehia-api.vkapsprojects.com/edit_chat");

      final response = await http.patch(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "chat_id": chat_id,
          "new_chat_name":new_chat_name
        }),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      if (response.statusCode == 200) {
        return Model.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }

  //delete chat
  Future<bool?> deleteChat(String email, String chatId) async {
    try {
      var url = Uri.parse(
        "https://yehia-api.vkapsprojects.com/chat",
      );

      final response = await http.delete(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "chat_id": chatId,
        }),
      );

      print("Status: ${response.statusCode}");
      print("Body: ${response.body}");

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  //update question
  Future<dynamic> editQustion(String email,String chat_id,String history_id,String new_question) async{
    try {
      var url = Uri.parse(
          "https://yehia-api.vkapsprojects.com/update_question");

      final response = await http.patch(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "chat_id": chat_id,
          "history_id":history_id,
          "new_question":new_question
        }),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      if (response.statusCode == 200) {
        return Model.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }
  // -------------------------
  // Helper: Extract Message
  // -------------------------
  String extractMessage(dynamic message) {
    if (message is String) return message;
    if (message is List) return message.join(", ");
    return "Something went wrong";
  }

  // -------------------------
  // Email Verification API
  // -------------------------
  Future<ApiResponse> getEmaildata(String email) async {
    try {
      var url = Uri.parse(
        "https://yehia-api-nest.vkapsprojects.com/verifications/initiate-mail-verification",
      );

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      var body = jsonDecode(response.body);
      // ✅ Agar API success ho tabhi email save karo
      if (response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("email", email);
      }

      return ApiResponse(
        success: response.statusCode == 201,
        data: body,
        message: extractMessage(body["message"]),
        statusCode: response.statusCode,
      );

    } catch (e) {
      return ApiResponse(
        success: false,
        data: null,
        message: "Network Error: $e",
        statusCode: 0,
      );
    }
  }

  // -------------------------
  // SIGNUP API
  // -------------------------
  Future<ApiResponse> getSignUpData(
      String firstName,
      String lastName,
      String email,
      String password,
      String userType,
      String otp,
      ) async {
    try {
      var url = Uri.parse(
        "https://yehia-api-nest.vkapsprojects.com/users/register",
      );

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "userType": userType,
          "otp": otp,
        }),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      var body = jsonDecode(response.body);

      if (response.statusCode == 201) {
        return ApiResponse(
          success: true,
          data: SignupModel.fromJson(body),
          message: extractMessage(body["message"]),
          statusCode: 201,
        );
      } else {
        return ApiResponse(
          success: false,
          data: null,
          message: extractMessage(body["message"]),
          statusCode: response.statusCode,
        );
      }

    } catch (e) {
      return ApiResponse(
        success: false,
        data: null,
        message: "Network Error: $e",
        statusCode: 0,
      );
    }
  }
  //login
  Future<ApiResponse> loginData(String email, String password) async {
    try {
      var url = Uri.parse(
        "https://yehia-api-nest.vkapsprojects.com/auth/login",
      );

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      var body = jsonDecode(response.body);

      if (response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // ✅ SAVE EMAIL
        await prefs.setString("email", email);

        // 🔥 SAVE TOKEN (CORRECT KEY)
        await prefs.setString(
          "access_token",
          body["access_token"],
        );

        print("TOKEN SAVED => ${body["access_token"]}");
      }

      return ApiResponse(
        success: body["success"] == true,
        data: body,
        message: extractMessage(body["message"]),
        statusCode: response.statusCode,
      );
    } catch (e) {
      return ApiResponse(
        success: false,
        data: null,
        message: "Network Error: $e",
        statusCode: 0,
      );
    }
  }

  //get Profile
  Future<ApiResponse> profileData(String accessToken) async {
    try {
      var url = Uri.parse("https://yehia-api-nest.vkapsprojects.com/users/profile");

      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      final body = jsonDecode(response.body);

      // API might return user data inside a nested object, adjust if needed
      final data = body["data"] ?? body;

      return ApiResponse(
        success: response.statusCode == 200,
        data: data,
        message: extractMessage(body["message"]),
        statusCode: response.statusCode,
      );
    } catch (e) {
      print("PROFILE ERROR: $e");
      return ApiResponse(
        success: false,
        data: null,
        message: "Network Error: $e",
        statusCode: 0,
      );
    }
  }

  //profile Update
  Future<ApiResponse> profileUpdate(
      String firstName,
      String lastName,
      String userType,
      String accessToken,
      ) async {
    try {
      var url = Uri.parse("https://yehia-api-nest.vkapsprojects.com/users/profile");

      final response = await http.patch(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "userType": userType,
        }),
      );

      print("TOKEN SENT => $accessToken");
      print("STATUS CODE => ${response.statusCode}");
      print("RESPONSE BODY => ${response.body}");

      final body = jsonDecode(response.body);

      // Some APIs return updated user in `data`, adjust if necessary
      final data = body["data"] ?? body;

      return ApiResponse(
        success: body["success"] == true,
        data: data,
        message: extractMessage(body["message"]),
        statusCode: response.statusCode,
      );
    } catch (e) {
      print("UPDATE PROFILE ERROR: $e");
      return ApiResponse(
        success: false,
        data: null,
        message: "Network Error: $e",
        statusCode: 0,
      );
    }
  }

  //pdf
  Future<ApiResponse> pdfData(CarLeasePdfRequest request) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("access_token");

      final url = Uri.parse(
        "https://yehia-api-nest.vkapsprojects.com/pdf/export-car-lease",
      );

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(request.toJson()),
      );

      print("PDF STATUS => ${response.statusCode}");

      if (response.statusCode != 200) {
        return ApiResponse(
          success: false,
          data: null,
          message: "Failed to generate PDF",
          statusCode: response.statusCode,
        );
      }

      // 🔥 PDF BYTES
      return ApiResponse(
        success: true,
        data: response.bodyBytes, // 👈 IMPORTANT
        message: "PDF generated successfully",
        statusCode: 200,
      );
    } catch (e) {
      return ApiResponse(
        success: false,
        data: null,
        message: "Network Error: $e",
        statusCode: 0,
      );
    }
  }

}


// ----------------------------------
// UNIVERSAL API RESPONSE CLASS
// ----------------------------------
class ApiResponse {
  final bool success;
  final dynamic data;
  final String message;
  final int statusCode;

  ApiResponse({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
  });


}
