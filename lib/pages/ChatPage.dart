import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: ChatAppBar(),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                ChatListWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
