import 'package:flutter/material.dart';

const chatNavy = Color(0xFF202B48);
const chatOat = Color(0xFFF4F0E8);
const chatLilac = Color(0xFFDCD5EA);
const chatPurple = Color(0xFF7664A5);
const chatWhite = Color(0xFFFFFFFF);
const chatMuted = Color(0xFF72727B);

class ChatMessage {
  final String text;
  final bool isBot;

  ChatMessage({
    required this.text,
    required this.isBot,
  });
}

class ChatbotWidget extends StatefulWidget {
  const ChatbotWidget({super.key});

  @override
  State<ChatbotWidget> createState() => _ChatbotWidgetState();
}

class _ChatbotWidgetState extends State<ChatbotWidget> {
  bool isOpen = false;
  bool isTyping = false;

  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final List<ChatMessage> messages = [
    ChatMessage(
      text:
      'Hello! 👋 Welcome to MT Alchemy.\n\n'
          'I can help you explore our learning pathways, '
          'services, resources and employer portal.\n\n'
          'What would you like to know?',
      isBot: true,
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  String getReply(String input) {
    final text = input.toLowerCase();

    if (text.contains('hello') ||
        text.contains('hi') ||
        text == 'hey') {
      return 'Hello! 👋 Welcome to MT Alchemy. '
          'How can I help you today?';
    }

    if (text.contains('course') ||
        text.contains('upskill') ||
        text.contains('learn') ||
        text.contains('learning')) {
      return 'Our learning pathways help you develop practical skills '
          'through four stages: Discover, Practice, Transform and Impact.\n\n'
          'Explore topics such as emotional intelligence, leadership, '
          'mindful communication and team trust.\n\n'
          'Choose "Upskilling" in the website navigation to get started.';
    }

    if (text.contains('service') ||
        text.contains('workshop') ||
        text.contains('training')) {
      return 'MT Alchemy offers people-centred development in:\n\n'
          '• Emotional intelligence\n'
          '• Leadership development\n'
          '• Team engagement\n'
          '• Workplace well-being\n\n'
          'Open the Services page to explore these options.';
    }

    if (text.contains('price') ||
        text.contains('cost') ||
        text.contains('buy') ||
        text.contains('store') ||
        text.contains('journal') ||
        text.contains('workbook')) {
      return 'Welcome to the Alchemy Store! 🛍️\n\n'
          'You can explore reflection journals, leadership workbooks, '
          'conversation toolkits and team resources.\n\n'
          'Open the Store page to see the sample products and prices.';
    }

    if (text.contains('employer') ||
        text.contains('employee') ||
        text.contains('organisation') ||
        text.contains('organization') ||
        text.contains('team')) {
      return 'Our Employer Portal helps organisations manage team members, '
          'assign learning pathways and monitor learning progress.\n\n'
          'Choose "Employers" to explore the portal.';
    }

    if (text.contains('register') ||
        text.contains('sign up') ||
        text.contains('create account')) {
      return 'Ready to begin? ✨\n\n'
          'Select "Get started" or "Register" in the navigation '
          'to open the registration page.';
    }

    if (text.contains('login') ||
        text.contains('log in') ||
        text.contains('sign in')) {
      return 'Welcome back!\n\n'
          'Select "Sign in" or "Learning login" to access '
          'the login page.';
    }

    if (text.contains('contact') ||
        text.contains('email') ||
        text.contains('enquiry') ||
        text.contains('enquiry')) {
      return 'We would be happy to help you explore your development goals.\n\n'
          'Visit the Contact page or open Services to submit a service enquiry.';
    }

    if (text.contains('about')) {
      return 'MT Alchemy is a studio for human potential. '
          'We help individuals, teams and organisations turn '
          'personal insight into meaningful change.\n\n'
          'Visit the About page to learn more.';
    }

    if (text.contains('thank')) {
      return 'You are very welcome! 😊 Is there anything else '
          'I can help you explore?';
    }

    if (text.contains('bye')) {
      return 'Thank you for visiting MT Alchemy. '
          'Wishing you growth and meaningful change! 👋';
    }

    return 'Thanks for your question! 😊\n\n'
        'I can help with learning pathways, services, the store, '
        'registration and the employer portal.\n\n'
        'Try asking: "What courses do you offer?"';
  }

  void sendMessage() {
    final text = controller.text.trim();

    if (text.isEmpty || isTyping) return;

    setState(() {
      messages.add(ChatMessage(text: text, isBot: false));
      controller.clear();
      isTyping = true;
    });

    scrollToBottom();

    // Demo response engine; replace with an AI API for real AI replies.
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      setState(() {
        messages.add(
          ChatMessage(
            text: getReply(text),
            isBot: true,
          ),
        );
        isTyping = false;
      });

      scrollToBottom();
    });
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isOpen)
          Positioned(
            right: 20,
            bottom: 88,
            child: Material(
              elevation: 12,
              borderRadius: BorderRadius.circular(22),
              clipBehavior: Clip.antiAlias,
              child: Container(
                width: MediaQuery.of(context).size.width < 420
                    ? MediaQuery.of(context).size.width - 32
                    : 350,
                height: MediaQuery.of(context).size.height < 600
                    ? MediaQuery.of(context).size.height * 0.65
                    : 480,
                color: chatOat,
                child: Column(
                  children: [
                    // Chat header
                    Container(
                      color: chatNavy,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: chatLilac,
                            child: Icon(
                              Icons.auto_awesome,
                              color: chatNavy,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Alchemy Assistant',
                                  style: TextStyle(
                                    color: chatWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Here to help you grow',
                                  style: TextStyle(
                                    color: chatLilac,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() => isOpen = false);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: chatWhite,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Messages
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.all(14),
                        itemCount:
                        messages.length + (isTyping ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == messages.length) {
                            return const Padding(
                              padding: EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Alchemy Assistant is typing...',
                                  style: TextStyle(
                                    color: chatMuted,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          }

                          final message = messages[index];

                          return Align(
                            alignment: message.isBot
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 270,
                              ),
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: message.isBot
                                    ? chatWhite
                                    : chatLilac,
                                borderRadius:
                                BorderRadius.circular(16),
                              ),
                              child: Text(
                                message.text,
                                style: const TextStyle(
                                  color: chatNavy,
                                  fontSize: 13,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Message input
                    Container(
                      padding: const EdgeInsets.fromLTRB(
                        12, 8, 8, 12,
                      ),
                      decoration: const BoxDecoration(
                        color: chatWhite,
                        border: Border(
                          top: BorderSide(
                            color: Color(0xFFE5DFD5),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              onSubmitted: (_) => sendMessage(),
                              textInputAction: TextInputAction.send,
                              decoration: const InputDecoration(
                                hintText: 'Ask me anything...',
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: sendMessage,
                            style: IconButton.styleFrom(
                              backgroundColor: chatNavy,
                              foregroundColor: chatWhite,
                            ),
                            icon: const Icon(Icons.send, size: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        // Floating button
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton(
            backgroundColor: chatNavy,
            foregroundColor: chatWhite,
            onPressed: () {
              setState(() => isOpen = !isOpen);
            },
            child: Icon(
              isOpen ? Icons.close : Icons.chat_bubble_outline,
            ),
          ),
        ),
      ],
    );
  }
}