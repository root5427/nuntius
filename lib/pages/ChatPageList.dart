import 'package:flutter/material.dart';
import 'package:nuntius/widgets/InputWidget.dart';
import 'package:rubber/rubber.dart';
import 'ChatBottomSheet.dart';
import 'ChatPage.dart';

class ChatPageList extends StatefulWidget {
  @override
  _ChatPageListState createState() => _ChatPageListState();
  const ChatPageList();
}

class _ChatPageListState extends State<ChatPageList>
    with SingleTickerProviderStateMixin {
  var controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = RubberAnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                children: <Widget>[
                  ChatPage(),
                  ChatPage(),
                  ChatPage(),
                ],
              ),
            ),
            Container(
              child: GestureDetector(
                child: InputWidget(),
                onPanUpdate: (details) {
                  if (details.delta.dy < 0) {
                    _scaffoldKey.currentState
                        .showBottomSheet((BuildContext context) {
                      return ChatBottomSheet();
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
