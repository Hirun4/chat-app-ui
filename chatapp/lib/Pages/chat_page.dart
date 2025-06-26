import 'package:chatapp/CustomUI/custom_card.dart';
import 'package:chatapp/Model/chat_model.dart';
import 'package:chatapp/Screens/select_contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key ,this.chats});
  final List<ChatModel>? chats;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SelectContact()),
          );
        },
        backgroundColor: const Color(0xff128C7E),
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chats?.length ?? 0,
        itemBuilder: (context, index) {
          return CustomCard(chatModel: widget.chats![index]);
        },
      ),
    );
  }
}
