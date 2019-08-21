import 'package:flutter/material.dart';
import 'ChatPage.dart';

class ChatPageList extends StatefulWidget {
  @override
  _ChatPageListState createState() => _ChatPageListState();
}

class _ChatPageListState extends State<ChatPageList> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        ChatPage(),
        ChatPage(),
        ChatPage(),
      ],
    );
  }
}
