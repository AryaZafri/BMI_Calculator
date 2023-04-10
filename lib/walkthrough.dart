import 'package:bmi_calculator/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({Key? key}) : super(key: key);

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
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
              child: SwipeableButtonView(
                  isFinished: _isFinished,
                  onFinish: () async {
                    await Navigator.push(
                        context,
                        PageTransition(
                            child: HomeScreen(),
                            type: PageTransitionType.fade));
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
        ),
      ),
    );
  }
}
