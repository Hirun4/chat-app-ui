import 'package:chatapp/Model/chat_model.dart';
import 'package:chatapp/Screens/individual_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.chatModel});

  final ChatModel? chatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IndividualPage(chatModel: chatModel,)),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                (chatModel?.isGroup ?? false)
                    ? 'assets/groups.svg'
                    : 'assets/person.svg',
                width: 38,
                height: 38,
                color: Colors.white,
              ),
            ),
            title: Text(
              chatModel?.name ?? 'Unknown',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 5),
                Text(
                  chatModel?.currentMessage ?? 'No message',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
              ],
            ),
            trailing: Text(
              chatModel?.time ?? '00:00',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(thickness: 1, color: Colors.grey[300]),
          ),
        ],
      ),
    );
  }
}
