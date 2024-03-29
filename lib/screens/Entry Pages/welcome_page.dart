import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ker_diagnostics_app/screens/Home%20Pages/home_page.dart';

import '../../utilities/nav_bar.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // set a delay of 3 seconds before navigating to the next page
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BotNavBar(
                selectedIndex: 0,
              )));
    });
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 0, 90, 172),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(220.0),
              topRight: Radius.circular(220.0),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 400),
                Image(
                  image: AssetImage(
                    'assets/images/kerlogo.jpg',
                  ),
                ),
                /*SizedBox(height: 80),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400],
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/SignIn');
                  },
                  child: Text(
                    "Sign in to your account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Not registered yet? ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Create an account",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          height: 2.5,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/Register');
                          },
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
