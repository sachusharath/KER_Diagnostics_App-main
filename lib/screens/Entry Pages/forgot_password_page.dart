import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ker_diagnostics_app/widgets/Forgot%20Password%20Page/forgot_password_content.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                SizedBox(height: 200),
                Image(
                  image: AssetImage(
                    'assets/images/kerlogo.jpg',
                  ),
                ),
                ForgotPasswordContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
