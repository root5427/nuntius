import 'package:flutter/material.dart';
import 'package:nuntius/config/Palette.dart';
import 'package:intl/intl.dart';

class ChatItemWidget extends StatelessWidget {
  final int index;
  const ChatItemWidget(this.index);
  @override
  Widget build(BuildContext context) {
    if (index % 2 == 0) {
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text('This is a sent message',
                      style: TextStyle(color: Palette.selfMessageColor)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: Palette.selfMessageBackgroundColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  margin: EdgeInsets.only(right: 10.0),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Text(
                      DateFormat('dd MM kk:mm').format(
                          DateTime.fromMillisecondsSinceEpoch(1565888474278)),
                      style: TextStyle(
                        color: Palette.greyColor,
                        fontSize: 12.0,
                        fontStyle: FontStyle.normal,
                      )),
                  margin: EdgeInsets.only(left: 5.0, top: 0.5, bottom: 0.5),
                ),
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text('This is a received message',
                      style: TextStyle(color: Palette.otherMessageColor)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: Palette.otherMessageBackgroundColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  margin: EdgeInsets.only(left: 10.0),
                )
              ],
            ),
            Container(
              child: Text(
                  DateFormat('dd MM kk:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(1565888474278)),
                  style: TextStyle(
                    color: Palette.greyColor,
                    fontSize: 12.0,
                    fontStyle: FontStyle.normal,
                  )),
              margin: EdgeInsets.only(left: 5.0, top: 0.5, bottom: 0.5),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      );
    }
  }
}
