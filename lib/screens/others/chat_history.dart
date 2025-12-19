import 'package:flutter/material.dart';
import 'package:lawyer/provider/api_provider.dart';
import 'package:lawyer/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_main_screen/chat_screen.dart';

class ChatHistory extends StatefulWidget {
  const ChatHistory({super.key});

  @override
  State<ChatHistory> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChatHistory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chat History"),
      ),
      body: Consumer<ApiProvider>(
        builder: (context, provider, child) {

          // 1️⃣ Loading State
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2️⃣ Empty State
          if (provider.chatList.isEmpty) {
            return const Center(
              child: Text(
                "No chats found!",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          // 3️⃣ Show Chat List
          return ListView.builder(
            itemCount: provider.chatList.length,
            itemBuilder: (context, index) {
              final chat = provider.chatList[index];

              return ListTile(
                leading: const Icon(Icons.chat_bubble_outline),
                title: Text(chat["chat_name"] ?? "New Chat"),
               //  title: Text(
               //    chat["history"].isEmpty
               //        ? "No messages yet"
               //        : chat["history"].last["req"] ?? "",
               //    maxLines: 1,
               //    overflow: TextOverflow.ellipsis,
               //  ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            TextEditingController editController =
                            TextEditingController(text: chat["chat_name"]);

                            return AlertDialog(
                              title: Text("Edit Chat Name"),
                              content: TextField(
                                controller: editController,
                                decoration: InputDecoration(hintText: "Enter new name"),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Cancel"),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                   // String? email=await AuthService.getSavedEmail();
                                    var pref=await SharedPreferences.getInstance();
                                    var email=pref.getString("email");


                                    Navigator.pop(context);

                                    /// Provider call
                                    await Provider.of<ApiProvider>(
                                      context,
                                      listen: false,
                                    ).chatNameEdit(
                                      email.toString(),                // Email
                                      chat["chat_id"],     // Correct chat_id
                                      editController.text, // New name
                                    );
                                  },
                                  child: Text("Save"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),

                    /// DELETE BUTTON
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async{
                        // String? email=await AuthService.getSavedEmail();
                        var pref=await SharedPreferences.getInstance();
                        var email=pref.getString("email");

                        Provider.of<ApiProvider>(context, listen: false).deleteChat(
                          context,
                          email.toString(),
                          chat["chat_id"],
                        );
                      },
                    ),
                  ],
                ),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        chat_id: chat["chat_id"],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<void> getChatHistory() async{
   // String? email=await AuthService.getSavedEmail();
    var pref=await SharedPreferences.getInstance();
    var email=pref.getString("email");
    await Provider.of<ApiProvider>(context,listen: false).getChatHistory(context, email.toString());
  }
}
