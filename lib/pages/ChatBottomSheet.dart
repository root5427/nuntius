import 'package:flutter/material.dart';
import 'package:nuntius/config/Palette.dart';
import 'package:nuntius/config/Styles.dart';
import 'package:nuntius/widgets/ChatRowWidget.dart';
import 'package:nuntius/widgets/NavigationPillWidget.dart';

class ChatBottomSheet extends StatefulWidget {
  @override
  _ChatBottomSheetState createState() => _ChatBottomSheetState();
  const ChatBottomSheet();
}

class _ChatBottomSheetState extends State<ChatBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            GestureDetector(
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  NavigationPillWidget(),
                  Center(child: Text('Messages', style: Styles.textHeading)),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              onVerticalDragEnd: (details) {
                print('Dragged DOWN');
                if (details.primaryVelocity > 50) {
                  Navigator.pop(context);
                }
              },
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 75, right: 20),
                child: Divider(
                  color: Palette.accentColor,
                ),
              ),
              itemBuilder: (context, index) {
                return ChatRowWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
