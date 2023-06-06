import 'package:flutter/material.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/components/rounded_buttons.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation animation1;
  late Animation animation2;

  @override
  void initState() {
    super.initState();
    controller1 =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    controller2 =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    animation1 = ColorTween(begin: Colors.teal, end: Colors.deepOrangeAccent)
        .animate(controller1);
    animation2 =
        ColorTween(begin: Colors.white, end: Colors.black).animate(controller2);
    controller1.forward();
    controller2.forward();
    controller1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller1.reverse(from: 4);
      } else if (status == AnimationStatus.dismissed) {
        controller1.forward();
      }
    });
    controller2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller2.reverse(from: 4);
      } else if (status == AnimationStatus.dismissed) {
        controller2.forward();
      }
    });
    controller1.addListener(() {
      setState(() {});
    });
    controller2.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation1.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: animation2.value,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButtons(Colors.lightBlueAccent, 'Log In', () {
              Navigator.pushNamed(context, 'login_screen');
            }),
            RoundButtons(Colors.blueAccent, 'Register', () {
              Navigator.pushNamed(context, 'registration_screen');
            }),
          ],
        ),
      ),
    );
  }
}
