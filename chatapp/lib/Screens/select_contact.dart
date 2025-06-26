import 'package:chatapp/CustomUI/button_card.dart';
import 'package:chatapp/CustomUI/contact_card.dart';
import 'package:chatapp/Model/chat_model.dart';
import 'package:chatapp/Screens/create_group.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: 'John Doe', status: 'fullstack developer'),
      ChatModel(name: 'John Dolton', status: 'web developer'),
      ChatModel(name: 'John Smith', status: 'mobile developer'),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Contact',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '256 Contacts',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
        backgroundColor: const Color(0xff075E54),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Implement search functionality here
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Invite a friend'),
                  value: "Invite a friend",
                ),
                PopupMenuItem(child: Text('Contact'), value: "Contact"),
                PopupMenuItem(child: Text('Refresh'), value: "Refresh"),
                PopupMenuItem(child: Text('Help'), value: "Help"),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateGroup()),
                );
              },
              child: ButtonCard(name: 'New Group', icon: Icons.group_add),
            );
          } else if (index == 1) {
            return ButtonCard(name: 'New Contact', icon: Icons.person_add);
          }
          return ContactCard(contact: contacts[index - 2]);
        },

        // Adjust the number of contacts as needed
      ),
    );
  }
}
