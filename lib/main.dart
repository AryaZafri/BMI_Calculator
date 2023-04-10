import 'package:bmi_calculator/home_screen.dart';
import 'package:bmi_calculator/walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Walkthrough(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('./assets/images/logo.png'),
        Text(
          'Calculate Your',
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
        ),
        Text(
          'Body Mass Index',
          style: TextStyle(
              fontSize: 28,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              color: Colors.blue),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child:
          SwipeableButtonView(
              isFinished: _isFinished,
              onFinish: () async {
                await Navigator.push(
                    context,
                    PageTransition(
                        child: HomeScreen(), type: PageTransitionType.fade));
                setState(() {
                  _isFinished = false;
                });
              },
              onWaitingProcess: () {
                Future.delayed(Duration(seconds: 0), () {
                  setState(() {
                    _isFinished = true;
                  });
                });
              },
              activeColor: Colors.blue,
              buttonWidget: const Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.black,
              ),
              buttonText: "GET STARTED"),
        ),
      ],
    )));
  }
}
