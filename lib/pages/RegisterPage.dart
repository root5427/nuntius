import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nuntius/config/Assets.dart';
import 'package:nuntius/config/Palette.dart';
import 'package:nuntius/config/Styles.dart';
import 'package:nuntius/config/Transitions.dart';
import 'package:nuntius/pages/ChatPageList.dart';
import 'package:nuntius/widgets/CircleIndicator.dart';
import 'package:nuntius/widgets/NumberPickerWidget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  int currentPage = 0;
  int age = 18;
  var isKeyBoardOpen = false;
  PageController pageController = PageController();
  Alignment begin = Alignment.center;
  Alignment end = Alignment.bottomRight;

  AnimationController usernameFieldAC;
  Animation profilePicHeightAnimation, usernameAnimation, ageAnimation;
  FocusNode usernameFocusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    usernameFieldAC =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    profilePicHeightAnimation =
        Tween(begin: 100.0, end: 0.0).animate(usernameFieldAC)
          ..addListener(() {
            setState(() {});
          });
    usernameAnimation = Tween(begin: 50.0, end: 10.0).animate(usernameFieldAC)
      ..addListener(() {
        setState(() {});
      });
    ageAnimation = Tween(begin: 80.0, end: 10.0).animate(usernameFieldAC)
      ..addListener(() {
        setState(() {});
      });
    usernameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus) {
        usernameFieldAC.forward();
      } else {
        usernameFieldAC.reverse();
      }
    });
    pageController.addListener(() {
      setState(() {
        begin = Alignment(pageController.page, pageController.page);
        end = Alignment(1 - pageController.page, 1 - pageController.page);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: begin, end: end, colors: [
                Palette.gradientStartColor,
                Palette.gradientEndColor,
              ]),
            ),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (int page) => updatePageState(page),
                    children: <Widget>[
                      buildPageOne(),
                      buildPageTwo(),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 2; ++i)
                        CircleIndicator(i == currentPage), //todo
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: currentPage == 1 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    margin: EdgeInsets.only(right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: () => navigateToHome(),
                          elevation: 0,
                          backgroundColor: Palette.primaryColor,
                          child: Icon(
                            Icons.done,
                            color: Palette.accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    if (currentPage == 1) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  updatePageState(index) {
    if (index == 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
    setState(() {
      currentPage = index;
    });
  }

  Widget buildPageOne() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 250.0),
            child: Image.asset(
              Assets.app_icon_fg,
              height: 100,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Text(
              'Nuntius',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100.0),
            child: ButtonTheme(
              height: 40.0,
              child: RaisedButton.icon(
                onPressed: () => updatePageState(1),
                elevation: 0,
                color: Colors.transparent,
                icon: Image.asset(
                  Assets.icon_google,
                  height: 25,
                ),
                label: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    color: Palette.primaryTextColorLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPageTwo() {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: profilePicHeightAnimation.value,
            ),
            Container(
              child: CircleAvatar(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.camera,
                      size: 15,
                      color: Colors.white,
                    ),
                    Text(
                      'Set Profile Picture',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                backgroundImage: Image.asset(Assets.user).image,
                radius: 64.0,
              ),
            ),
            SizedBox(
              height: ageAnimation.value,
            ),
            Text(
              'How old are you?',
              style: Styles.questionLight,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NumberPicker.horizontal(
                  initialValue: age,
                  minValue: 15,
                  maxValue: 100,
                  highlightSelectedValue: true,
                  onChanged: (num value) {
                    setState(() {
                      age = value;
                    });
                  },
                ),
                Text(
                  'Years',
                  style: Styles.textLight,
                ),
              ],
            ),
            SizedBox(
              height: usernameAnimation.value,
            ),
            Container(
              child: Text(
                'Choose a username',
                style: Styles.questionLight,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              width: 120.0,
              child: TextField(
                textAlign: TextAlign.center,
                style: Styles.subHeadingLight,
                focusNode: usernameFocusNode,
                decoration: InputDecoration(
                  hintText: '@username',
                  hintStyle: Styles.hintTextLight,
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Palette.primaryColor,
                      width: 0.1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Palette.primaryColor,
                      width: 0.1,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  navigateToHome() {
    Navigator.push(
      context,
      SlideLeftRouter(
        //todo
        page: ChatPageList(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    usernameFieldAC.dispose();
    usernameFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final value = MediaQuery.of(context).viewInsets.bottom;
    if (value > 0) {
      if (isKeyBoardOpen) {
        onKeyboardChanged(false);
      }
      isKeyBoardOpen = false;
    } else {
      isKeyBoardOpen = true;
      onKeyboardChanged(true);
    }
    super.didChangeMetrics();
  }

  onKeyboardChanged(bool isVisible) {
    if (!isVisible) {
      FocusScope.of(context).requestFocus(FocusNode());
      usernameFieldAC.reverse();
    }
  }
}
