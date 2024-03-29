import 'package:flutter/material.dart';
import 'package:ker_diagnostics_app/widgets/Home%20Page/home_background.dart';
import 'package:ker_diagnostics_app/widgets/Home%20Page/home_content.dart';
import 'package:ker_diagnostics_app/widgets/Home%20Page/home_gradient.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Main page build return
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: double.infinity,
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Stack(
            // Return the background, gradient and content widgets
            children: <Widget>[
              HomeBackground(),
              HomeGradient(),
              HomeContent(),
            ],
          ),
        ),
      ),
    );
  }
}
