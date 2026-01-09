import 'package:flutter/material.dart';
import 'package:lawyer/provider/api_provider.dart';
import 'package:lawyer/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_screen.dart';

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
        backgroundColor: const Color(0XFF655F2E),

        centerTitle: true,
        title: Text("Chat History",style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(
          color: Colors.white, // Back button color
        ),
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
                leading: const Icon(Icons.arrow_circle_left_outlined),
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
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        var pref = await SharedPreferences.getInstance();
                        var email = pref.getString("email");

                        await Provider.of<ApiProvider>(
                          context,
                          listen: false,
                        ).deleteChat(
                          context,
                          email.toString(),
                          chat["chat_id"],
                        );

                        // 🔔 TOP SnackBar
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              "Chat deleted successfully",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.redAccent,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top + kToolbarHeight + 10,
                              left: 16,
                              right: 16,
                            ),
                            duration: const Duration(seconds: 2),
                          ),
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
              // return Column(
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (_) => ChatScreen(
              //               chat_id: chat["chat_id"],
              //             ),
              //           ),
              //         );
              //       },
              //       child: Container(
              //         width: double.infinity,
              //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              //         color: index == 0
              //             ? const Color(0xFFF7F3E8) // 👈 highlighted first item
              //             : Colors.transparent,
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             // 🔹 LEFT ARROW ICON
              //             const Icon(
              //               Icons.arrow_circle_left_outlined,
              //               color: Color(0xFF655F2E),
              //             ),
              //             const SizedBox(width: 12),
              //
              //             // 🔹 QUESTION TEXT
              //             Expanded(
              //               child: Text(
              //                 chat["chat_name"] ?? "New Chat",
              //                 style: const TextStyle(
              //                   fontSize: 16,
              //                   height: 1.4,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //
              //     // 🔹 DIVIDER
              //     const Divider(height: 1),
              //   ],
              // );

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