import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:flash_chat/components/paddingButtons.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState()  {
    Firebase.initializeApp();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.orange, end: Colors.white).animate(controller);
    controller.forward();
    animation.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
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
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            PaddingButtons(
              bgColor: Colors.blueAccent,
              text: 'Log-In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            PaddingButtons(
              bgColor: Colors.lightBlueAccent,
              text: 'Register',
              onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
            ),
          ],
        ),
      ),
    );
  }
}
