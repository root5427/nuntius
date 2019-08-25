import 'package:flutter/material.dart';
import 'package:nuntius/config/Palette.dart';
import 'package:nuntius/widgets/ChatAppBar.dart';
import 'package:nuntius/widgets/ChatListWidget.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
  const ChatPage();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ChatAppBar(),
        ),
        Expanded(
          flex: 11,
          child: Container(
            color: Palette.chatBackgroundColor,
            child: ChatListWidget(),
          ),
        ),
      ],
    );
  }
}
