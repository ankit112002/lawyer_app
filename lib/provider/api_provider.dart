
import 'package:flutter/material.dart';
import 'package:lawyer/screens/account/create_account_screen.dart';
import 'package:lawyer/screens/app_main_screen/chat_screen.dart';
import 'package:provider/provider.dart';

import '../models/my_model.dart';
import '../models/signup.dart';
import '../screens/others/home.dart';
import '../services/api_services.dart';
import '../session_controller.dart';

class ApiProvider with ChangeNotifier{
  String accessToken = "";
  Map<String, dynamic>? data;

  void setToken(String token) {
    accessToken = token;
    print("TOKEN SAVED => $accessToken");
    notifyListeners();
  }
  bool loginSuccess = false;
  String loginMessage = "";

  bool isLoading=false;
  Model? model;
  String apiResponse = "";
  getdata(BuildContext context,String email) async{
    isloading=true;
    notifyListeners();
    await ApiService().getdata(email).then((value) {
      if (value != null) {
        model = value;
        print("value: $model");
        print(model?.chatId ?? "chatId null");
         Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(
             chat_id:model!.chatId.toString()
         ),));
      } else {
        print("API returned NULL");
      }
      isloading = false;
      notifyListeners();
    });

  }

  List selectedChatHistory = [];
  // bool isLoading = false;

  Future<void> getChatData(String email, String chat_id, String question) async {
    isLoading = true;
    notifyListeners();

    // 1️⃣ User message add
    selectedChatHistory.add({"req": question, "res": null});
    notifyListeners();

    // 2️⃣ Call API
    final value = await ApiService().getQuestion(email, chat_id, question);

    // 3️⃣ Update response
    if (value != null && value["response"] != null) {
      // Last message response update
      selectedChatHistory[selectedChatHistory.length - 1]["res"] = value["response"];
      notifyListeners();
    }

    isLoading = false;
    notifyListeners();
  }

  void loadChatById(String chatId) {
    try {
      final chat = chatList.firstWhere((chat) => chat["chat_id"] == chatId);
      selectedChatHistory = List.from(chat["history"] ?? []);
    } catch (e) {
      selectedChatHistory = [];
    }
    notifyListeners();
  }



  List chatList = [];

  getChatHistory(BuildContext context,String email) async {
    isloading = true;
    notifyListeners();

    final res = await ApiService().getChatHistory(email);

    if (res != null) {
      chatList = res["data"]; // <----- IMPORTANT
      print("${chatList}");
      notifyListeners();
    }

    isloading = false;
    notifyListeners();
  }

  //chatedit
  chatNameEdit(String email,String chat_id,String new_chat_name) async{
    isloading = true;
    notifyListeners();

    final response = await ApiService().editChatName(email, chat_id, new_chat_name);

    if (response != null) {

      // 🔥 Find index in chatList
      int index = chatList.indexWhere((e) => e["chat_id"] == chat_id);

      if (index != -1) {
        // 🔥 Update locally in Provider
        chatList[index]["chat_name"] = new_chat_name;
      }
    }

    isloading = false;
    notifyListeners();
  }

  //chat delete
  Future<void> deleteChat(BuildContext context, String email, String chatId) async {
    isloading = true;
    notifyListeners();

    bool? success = await ApiService().deleteChat(email, chatId);

    if (success == true) {
      /// 🔥 Remove from UI list instantly
      chatList.removeWhere((item) => item["chat_id"] == chatId);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Chat deleted successfully")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete chat")),
      );
    }

    isloading = false;
    notifyListeners();
  }

  //editQuestion
  updateQuestion(String email,String chat_id,String history_id,String new_question) async{
    isloading = true;
    notifyListeners();

    final response = await ApiService().editQustion(email, chat_id, history_id, new_question);


    if (response != null) {

      // 🔥 Find chat index
      int chatIndex = chatList.indexWhere((e) => e["chat_id"] == chat_id);

      if (chatIndex != -1) {
        // 🔥 Find history index
        int historyIndex = chatList[chatIndex]["history"]
            .indexWhere((h) => h["history_id"] == history_id);

        if (historyIndex != -1) {
          // 🔥 Update question in local list
          chatList[chatIndex]["history"][historyIndex]["req"] = new_question;
        }
      }
    }

    isloading = false;
    notifyListeners();
  }
  bool isloading = false;

  // For Email API
  String emailMessage = "";
  bool emailSuccess = false;

  // For Signup API
  SignupModel? signupModel;
  String signupMessage = "";
  bool signupSuccess = false;

  //for Login Api
  // dynamic data;

  // -------------------------
  // EMAIL VERIFICATION API
  // -------------------------
  Future<void> getEmaildata(String email) async {
    isLoading = true;
    notifyListeners();

    ApiResponse response = await ApiService().getEmaildata(email);

    isLoading = false;

    emailMessage = response.message;
    emailSuccess = response.success;

    print("EMAIL API → Success: ${response.success}, Message: ${response.message}");

    notifyListeners();
  }

  // -------------------------
  // SIGNUP API
  // -------------------------
  Future<void> signUpData(
      String firstName,
      String lastName,
      String email,
      String password,
      String userType,
      String otp,
      ) async {
    isLoading = true;
    notifyListeners();

    ApiResponse response = await ApiService().getSignUpData(
      firstName,
      lastName,
      email,
      password,
      userType,
      otp,
    );

    isLoading = false;

    signupSuccess = response.success;
    signupMessage = response.message;

    if (response.success) {
      signupModel = response.data as SignupModel;
      print("SIGNUP SUCCESS → ${signupModel?.message}");
    } else {
      signupModel = null;
      print("SIGNUP ERROR → ${response.message}");
    }

    notifyListeners();
  }
  //login
  // -------------------------
// LOGIN API
// -------------------------
  Future<void> loginData(
      BuildContext context,
      String email,
      String password,
      ) async {
    isLoading = true;
    loginMessage = "";
    notifyListeners();

    try {
      final response = await ApiService().loginData(email, password);

      print("RAW RESPONSE => ${response.data}");

      if (response.data["success"] == true) {
        loginSuccess = true;
        loginMessage = response.data["message"];

        final token = response.data["access_token"];
        final user = response.data["user"];

        await SessionController.instance.setSession(
          user["_id"],
          token,
        );

        setToken(token);
        data = user;

        print("TOKEN SAVED => $token");
      } else {
        loginSuccess = false;
        loginMessage = response.data["message"] ?? "Login failed";
      }
    } catch (e, s) {
      print("LOGIN ERROR => $e");
      print("STACKTRACE => $s");
      loginSuccess = false;
      loginMessage = "Something went wrong";
    }

    isLoading = false;
    notifyListeners();
  }


  //getProfile
  Future<void> getProfileData(String accessToken) async {

    if (accessToken.isEmpty) return;

    isLoading = true;
    notifyListeners();

    ApiResponse response = await ApiService().profileData(accessToken);

    isLoading = false;

    if (response.success) {
      data = response.data;
      print("PROFILE SUCCESS → ${response.message}");
    } else {
      print("PROFILE ERROR → ${response.message}");
    }

    notifyListeners();
  }
  //update Profile
  Future<void> updateProfile(
      String firstName,
      String lastName,
      String userType,
      ) async {
    print("USING TOKEN => $accessToken");

    if (accessToken.isEmpty) {
      print("❌ TOKEN MISSING IN PROVIDER");
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      var response = await ApiService()
          .profileUpdate(firstName, lastName, userType, accessToken);

      if (response.success) {
        data?["firstName"] = firstName;
        data?["lastName"] = lastName;
        data?["userType"] = userType;
        print("✅ PROFILE UPDATED");
      } else {
        print("❌ API ERROR → ${response.message}");
      }
    } catch (e) {
      print("❌ NETWORK ERROR → $e");
    }

    isLoading = false;
    notifyListeners();
  }



}