import 'package:flutter/material.dart';
import 'package:nuntius/config/Palette.dart';
import 'package:nuntius/pages/ChatBottomSheet.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  InputWidget();
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 60.0,
      child: Container(
        child: Row(
          children: <Widget>[
            Material(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1.0),
                child: IconButton(
                  icon: Icon(Icons.face),
                  color: Palette.accentColor,
                  onPressed: () => {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return Container(
                            child: Wrap(
                              children: <Widget>[ChatBottomSheet()],
                            ),
                          );
                        })
                  },
                ),
              ),
              color: Colors.white,
            ),
            Flexible(
              child: Material(
                child: Container(
                  child: TextField(
                    style: TextStyle(
                        color: Palette.primaryTextColor, fontSize: 20.0),
                    controller: textEditingController,
                    decoration: InputDecoration.collapsed(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Type a message',
                        hintStyle: TextStyle(color: Palette.greyColor)),
                  ),
                ),
              ),
            ),
            Material(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => {},
                  color: Palette.accentColor,
                ),
              ),
              color: Colors.white,
            )
          ],
        ),
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Palette.greyColor,
              width: 0.5,
            ),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
