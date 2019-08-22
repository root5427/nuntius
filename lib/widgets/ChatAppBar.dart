import 'package:flutter/material.dart';
import '../config/Assets.dart';
import '../config/Palette.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 100.0;
  const ChatAppBar();
  @override
  Widget build(BuildContext context) {
    var textHeading = TextStyle(color: Palette.primaryTextColor, fontSize: 20);
    var textStyle = TextStyle(color: Palette.secondaryTextColor);

    // double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
            spreadRadius: 0.1,
          ),
        ]),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            color: Palette.primaryBackgroundColor,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(Icons.attach_file,
                                          color: Palette.secondaryColor),
                                      onPressed: () => {},
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text("Devix Rootix",
                                            style: textHeading),
                                        Text("@devixrootix", style: textStyle),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Photos",
                                  style: textStyle,
                                ),
                                VerticalDivider(
                                  width: 30.0,
                                  color: Palette.primaryTextColor,
                                ),
                                Text(
                                  "Viedos",
                                  style: textStyle,
                                ),
                                VerticalDivider(
                                  width: 30.0,
                                  color: Palette.primaryTextColor,
                                ),
                                Text("Files", style: textStyle),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Center(
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(Assets.user),
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
