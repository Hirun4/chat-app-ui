import 'package:chatapp/CustomUI/avatar_card.dart';
import 'package:chatapp/CustomUI/button_card.dart';
import 'package:chatapp/CustomUI/contact_card.dart';
import 'package:chatapp/Model/chat_model.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: 'John Doe', status: 'fullstack developer'),
    ChatModel(name: 'John Dolton', status: 'web developer'),
    ChatModel(name: 'John Smith', status: 'mobile developer'),
  ];

  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
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
              'Create Group',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Add participants',
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
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(height: groups.length > 0 ? 90 : 10);
              }
              return ContactCard(
                contact: contacts[index - 1],
                onTap: () {
                  setState(() {
                    contacts[index - 1].select = !contacts[index - 1].select;
                    print(
                      '${contacts[index - 1].name} select: ${contacts[index - 1].select}',
                    );
                    if (contacts[index - 1].select) {
                      groups.add(contacts[index - 1]);
                    } else {
                      groups.remove(contacts[index - 1]);
                    }
                  });
                },
              );
            },

            // Adjust the number of contacts as needed
          ),

          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 70,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          if (contacts[index].select == true) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  contacts[index].select = false;
                                  groups.remove(contacts[index]);
                                });
                              },
                              child: AvatarCard(contact: contacts[index]),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Divider(thickness: 1, color: Colors.grey[300]),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
