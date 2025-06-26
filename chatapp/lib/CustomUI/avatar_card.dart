import 'package:chatapp/Model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.contact});

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  'assets/person.svg',
                  width: 38,
                  height: 38,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 4,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 10,
                  child: Icon(Icons.clear, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Text(contact.name ?? '', style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
