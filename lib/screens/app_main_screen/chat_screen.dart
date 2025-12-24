import 'package:flutter/material.dart';
import 'package:lawyer/provider/api_provider.dart';
import 'package:lawyer/screens/app_main_screen/app_main_screen.dart';
import 'package:lawyer/screens/others/chat_history.dart';
import 'package:lawyer/services/auth_services.dart';
import 'package:lawyer/utility/custom_container_for_chat.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  final String chat_id;
  const ChatScreen({super.key, required this.chat_id});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ApiProvider>(context, listen: false)
          .loadChatById(widget.chat_id);
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Controllers (persistent)
  final TextEditingController chatNameController = TextEditingController();
  final TextEditingController questionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _isSending = false;

  @override
  void dispose() {
    chatNameController.dispose();
    questionController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Scroll to bottom helper
  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    Future.microtask(() => _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
    ));
  }

  Future<void> _sendMessage(BuildContext context) async {
    final text = questionController.text.trim();
    if (text.isEmpty) return;

    setState(() => _isSending = true);

    // Optional: add local optimistic message via provider if you want
    // For now call provider which may add response to provider state.
   // final email = await AuthService.getSavedEmail();
    var pref=await SharedPreferences.getInstance();
    var email=pref.getString("email");

    try {
      await Provider.of<ApiProvider>(context, listen: false)
          .getChatData(email.toString(), widget.chat_id, text);
      questionController.clear();
      _scrollToBottom();
    } catch (e) {
      // Optionally show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send message. Try again.")),
      );
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  Widget chatBubble({
    required String message,
    required bool isUser,
  }) {
    return Align(
      // 🔁 Opposite alignment
      alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            // 🔁 WhatsApp colors but opposite side
            color: isUser ? const Color(0xFFDCF8C6) : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(14),
              topRight: const Radius.circular(14),

              // 🔁 WhatsApp tail opposite
              bottomLeft: Radius.circular(isUser ? 0 : 14),
              bottomRight: Radius.circular(isUser ? 14 : 0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
              ),
            ],
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF655F2E)),
              child: Text("My Sidebar", style: TextStyle(color: Colors.white, fontSize: 22)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>AppMainScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("Chat History"),
              onTap: () async{
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatHistory(),));
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.logout),
            //   title: Text("Logout"),
            //   onTap: () {},
            // ),
          ],
        ),
      ),
      //        backgroundColor: Color(0XFF655F2E),
      backgroundColor: Color(0xFFF7F6F2),
      appBar: AppBar(
        backgroundColor: const Color(0XFF655F2E),
        automaticallyImplyLeading: false,

        leadingWidth: 90, // 🔥 IMPORTANT FIX

        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.arrow_back, size: 20, color: Colors.white),
                SizedBox(width: 6),
                Text(
                  "Back",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        title: const Text(
          "Ask a lawyer",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(Icons.list_outlined, size: 26, color: Colors.white),
          ),
        ],
      ),


        body: SafeArea(
        child: Column(
          children: [
            // Header area with intro and quick cards
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              color: Colors.transparent,
              child: Column(
                children: [
                  Text("Ask Avocato", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.black87)),
                  SizedBox(height: 6),
                  Text("Hello, how can I help you?", style: TextStyle(fontSize: 16, color: Colors.black54)),
                  SizedBox(height: 14),
                  SizedBox(
                    height: 86,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CustomBriefCard(text: "Give me a brief overview of the corporate\nsystem.", iconPath: "assets/icons/case-round_svgrepo.com.png"),
                        SizedBox(width: 12),
                        CustomBriefCard(text: "What are the basic rights and obligations\nof citizens under traffic law?", iconPath: "assets/icons/case-round_svgrepo.com.png"),
                        SizedBox(width: 12),
                        CustomBriefCard(text: "Difference between articles\nof incorporation and bylaws?", iconPath: "assets/icons/case-round_svgrepo.com.png"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            Divider(height: 1),

            // Messages list
            Expanded(
              child: Consumer<ApiProvider>(
                builder: (context, provider, child) {
                  final messages = provider.selectedChatHistory;

                  if (messages.isEmpty) {
                    return Center(child: Text("No chat messages"));
                  }

                  // Scroll to bottom whenever new message arrives
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                      );
                    }
                  });

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          // 🟢 USER MESSAGE → LEFT
                          if (msg["req"] != null)
                            Align(
                              alignment: Alignment.centerLeft, // 🔁 CHANGED
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDCF8C6),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12), // 🔁 tail left
                                  ),
                                ),
                                child: Text(
                                  msg["req"],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),

                          // ⚪ BOT MESSAGE → RIGHT
                          if (msg["res"] != null)
                            Align(
                              alignment: Alignment.centerRight, // 🔁 CHANGED
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12), // 🔁 tail right
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  msg["res"],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  );

                },
              ),
            ),
            // Typing / Loading indicator (simple)
            Consumer<ApiProvider>(
              builder: (context, provider, child) {
                return provider.isLoading
                    ? Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Typing...", style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                )
                    : SizedBox();
              },
            ),


            // Bottom input
            Material(
              elevation: 8,
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.fromLTRB(12, 8, 12, 12),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFFFBF6EA),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: questionController,
                                minLines: 1,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  hintText: "Enter the message...",
                                  border: InputBorder.none,
                                ),
                                onSubmitted: (_) => _sendMessage(context),
                              ),
                            ),
                            SizedBox(width: 8),
                            // Optional small action icons
                            GestureDetector(
                              onTap: () {
                                // e.g., show quick prompts or attachments
                              },
                              child: Icon(Icons.add, size: 22, color: Color(0xFF655F2E)),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    // Send button
                    GestureDetector(
                      onTap: _isSending ? null : () => _sendMessage(context),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: _isSending ? Colors.grey : Color(0xFF3CAF50),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 6, offset: Offset(0, 4)),
                          ],
                        ),
                        child: Icon(Icons.send, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
