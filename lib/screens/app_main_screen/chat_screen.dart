import 'package:flutter/material.dart';
import 'package:lawyer/provider/api_provider.dart';
import 'package:lawyer/screens/app_main_screen/app_main_screen.dart';
import 'package:lawyer/screens/app_main_screen/chat_history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final String chat_id;
  const ChatScreen({super.key, required this.chat_id});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController questionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isSending = false;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ApiProvider>(context, listen: false)
          .loadChatById(widget.chat_id);
    });
    _loadChatHistory();

  }

  @override
  void dispose() {
    questionController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  Future<void> _loadChatHistory() async {
    var pref = await SharedPreferences.getInstance();
    var email = pref.getString("email");

    Provider.of<ApiProvider>(
      context,
      listen: false,
    ).getChatHistory(context, email.toString());
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    Future.microtask(
          () => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      ),
    );
  }

  Future<void> _sendMessage(BuildContext context) async {
    final text = questionController.text.trim();
    if (text.isEmpty) return;
    questionController.clear();
    setState(() => _isSending = true);

    var pref = await SharedPreferences.getInstance();
    var email = pref.getString("email");

    try {
      await Provider.of<ApiProvider>(context, listen: false)
          .getChatData(email.toString(), widget.chat_id, text);
      _scrollToBottom();
      await _loadChatHistory();

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to send message. Try again.")),
      );
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  void _onQuickCardTap(String text) {
    questionController.text = text;
    questionController.selection =
        TextSelection.fromPosition(TextPosition(offset: text.length));
    Future.delayed(const Duration(milliseconds: 100), () {
      _sendMessage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _buildDrawer(context),

      backgroundColor: const Color(0xFFF7F6F2),
      appBar: _buildAppBar(),
      body: SafeArea(
          child: Consumer<ApiProvider>(
            builder: (context, provider, _) {
              final isChatStarted = provider.selectedChatHistory.isNotEmpty;

              return Column(
                children: [

                  // 👇 TOP SECTION (sirf tab jab chat start NAHI hui)
                  if (!isChatStarted)
                    Expanded(
                      child: Center(
                        child: _buildAskAvocatoSection(),
                      ),
                    ),

                  // 👇 CHAT MESSAGES (sirf tab jab chat start ho)
                  if (isChatStarted)
                    Expanded(
                      child: _buildMessagesList(),
                    ),

                  _buildTypingIndicator(),
                  _buildBottomInput(),
                ],
              );
            },
          ),
      )
    );
  }

  // --------------------- WIDGETS ---------------------

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 HEADER
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Your conversations",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Divider(height: 1),

            // 🔹 CHAT HISTORY LIST
            Expanded(
              child: Consumer<ApiProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (provider.chatList.isEmpty) {
                    return const Center(
                      child: Text("No conversations found"),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.chatList.length,
                    itemBuilder: (context, index) {
                      final chat = provider.chatList[index];

                      return InkWell(
                        onTap: () {
                          Navigator.pop(context); // 👈 close drawer

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(
                                chat_id: chat["chat_id"],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          color: index == 0
                              ? const Color(0xFFF7F3E8) // selected
                              : Colors.transparent,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.arrow_circle_left_outlined,
                                color: Color(0xFF655F2E),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  chat["chat_name"] ?? "New Chat",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              // IconButton(
                              //   icon: const Icon(Icons.delete,size: 20),
                              //   onPressed: () async {
                              //     var pref = await SharedPreferences.getInstance();
                              //     var email = pref.getString("email");
                              //
                              //     await Provider.of<ApiProvider>(
                              //       context,
                              //       listen: false,
                              //     ).deleteChat(
                              //       context,
                              //       email.toString(),
                              //       chat["chat_id"],
                              //     );
                              //
                              //     // 🔔 TOP SnackBar
                              //     ScaffoldMessenger.of(context).clearSnackBars();
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(
                              //         content: const Text(
                              //           "Chat deleted successfully",
                              //           style: TextStyle(color: Colors.white),
                              //         ),
                              //         backgroundColor: Colors.redAccent,
                              //         behavior: SnackBarBehavior.floating,
                              //         margin: EdgeInsets.only(
                              //           top: MediaQuery.of(context).padding.top + kToolbarHeight + 10,
                              //           left: 16,
                              //           right: 16,
                              //         ),
                              //         duration: const Duration(seconds: 2),
                              //       ),
                              //     );
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF655F2E),
      automaticallyImplyLeading: false,
      leadingWidth: 60, // fixed width for back icon
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(Icons.arrow_back, size: 24, color: Colors.white),
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
        SizedBox(
          width: 60, // same as leading width to perfectly center title
          child: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
            icon: const Icon(Icons.list_outlined, size: 26, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildAskAvocatoSection() {
    return Consumer<ApiProvider>(
      builder: (context, provider, _) {
        if (provider.selectedChatHistory.isNotEmpty) return const SizedBox.shrink();

        final items = [
          {
            "text": "Give me a brief overview of the corporate system.",
            "onTap": () => _onQuickCardTap(
                "Give me a brief overview of the corporate system."),
          },
          {
            "text":
            "What are the basic rights and obligations of citizens under traffic law?",
            "onTap": () => _onQuickCardTap(
                "What are the basic rights and obligations of citizens under traffic law?"),
          },
          {
            "text": "Difference between articles of incorporation and bylaws?",
            "onTap": () => _onQuickCardTap(
                "Difference between articles of incorporation and bylaws?"),
          },
        ];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Ask Avocato",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Hello, how can I help you?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 14),

              // Centered GridView
              LayoutBuilder(builder: (context, constraints) {
                final isWide = constraints.maxWidth > 600;

                return Center( // centers GridView horizontally
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isWide ? 600 : double.infinity, // optional max width
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isWide ? 2 : 1,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: isWide ? 3.2 : 3.5,
                      ),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return CustomBriefCard(
                          text: item["text"] as String,
                          iconPath: "assets/icons/case-round_svgrepo.com.png",
                          onTap: item["onTap"] as VoidCallback,
                        );
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }



  Widget _buildMessagesList() {
    return Expanded(
      child: Consumer<ApiProvider>(
        builder: (context, provider, _) {
          final messages = provider.selectedChatHistory;
          if (messages.isEmpty) return const Center(child: Text(""));

          WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

          return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final msg = messages[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (msg["req"] != null)
                    _chatBubble(msg["req"], isUser: true),
                  if (msg["res"] != null)
                    _chatBubble(msg["res"], isUser: false),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _chatBubble(String message, {required bool isUser}) {
    return Column(
      crossAxisAlignment:
      isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        // 🔹 NAME + TIME
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Row(
            mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              // Text(
              //   isUser ? "John Doe" : "أفوكاتو",
              //   style: const TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 14,
              //   ),
              // ),
              const SizedBox(width: 8),
              Text(
                _formatTime(),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),

        // 🔹 MESSAGE ROW
        Row(
          mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUser) _avatar(false),

            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color:
                  isUser ? Colors.grey.shade200 : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl, // 🔥 Arabic support
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),

            if (isUser) _avatar(true),
          ],
        ),
      ],
    );
  }
  Widget _avatar(bool isUser) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: CircleAvatar(
        radius: 20,
        backgroundColor:Color(0xffF1E3BD),
        child: isUser
            ? const Icon(Icons.person,size: 30, color: Colors.white)
            : Image.asset(
          "assets/images/AI avacato logo.png",
          width: 24,
        ),
      ),
    );
  }
  String _formatTime() {
    final now = DateTime.now();
    return TimeOfDay.fromDateTime(now).format(context);
  }


  Widget _buildTypingIndicator() {
    return Consumer<ApiProvider>(
      builder: (context, provider, _) {
        if (!provider.isLoading) return const SizedBox();

        return Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.amber.shade200,
                child: Image.asset(
                  "assets/images/AI avacato logo.png",
                  width: 18,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xffF1E3BD),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text("Typing...."),
              //   Text("● ● ●"),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomInput() {
    return Material(
      elevation: 8,
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFFBF6EA),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              // 🔹 Send button on left
              GestureDetector(
                onTap: _isSending ? null : () => _sendMessage(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: _isSending
                        ? const LinearGradient(
                      colors: [Colors.grey, Colors.grey],
                    )
                        : const LinearGradient(
                      colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Image.asset(
                    "assets/icons/Vector.png",
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // 🔹 Expanded TextField with hint aligned right
              Expanded(
                child: TextField(
                  controller: questionController,
                  minLines: 1,
                  maxLines: 5,
                  textAlign: TextAlign.right, // hint and input aligned right
                  decoration: const InputDecoration(
                    hintText: "Enter your message...",
                    hintTextDirection: TextDirection.ltr,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  onSubmitted: (_) => _sendMessage(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

// --------------------- CustomBriefCard ---------------------

class CustomBriefCard extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onTap;

  const CustomBriefCard({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2), // thickness of the gradient border
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white, // inner card color
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset(iconPath, width: 36, height: 36),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                 Image.asset(iconPath, width: 36, height: 36),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
