import 'package:flutter/material.dart';
import 'package:ker_diagnostics_app/utilities/nav_bar.dart';
import 'package:ker_diagnostics_app/widgets/Home%20Page/home_ker_card.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();

  const HomeContent({Key? key}) : super(key: key);
}

class _HomeContentState extends State<HomeContent> {
  // home page main content build
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: <Widget>[
        // Bring in the AppSummary widget
        AppSummary(),
        // create a container for all the text on the page
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Diagnose Service',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveValue(
                    context,
                    defaultValue: 22.0,
                    valueWhen: const [
                      Condition.smallerThan(
                        name: MOBILE,
                        value: 18.0,
                      ),
                    ],
                  ).value,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Use our tool to self-diagnose your vessel parts from anywhere yourself.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ResponsiveValue(
                    context,
                    defaultValue: 18.0,
                    valueWhen: const [
                      Condition.smallerThan(
                        name: MOBILE,
                        value: 14.0,
                      ),
                    ],
                  ).value,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 45),
                    height: 40,
                    width: ResponsiveValue(
                      context,
                      defaultValue: 170.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 160.0,
                        ),
                      ],
                    ).value,
                    // Setup box decoration for border control
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 0, 90, 172), width: 2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // create the elevated button
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 0, 90, 172)),
                      // Set the child to be a text widget with purpose of button
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Summon the tool',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveValue(
                                context,
                                defaultValue: 16.0,
                                valueWhen: const [
                                  Condition.smallerThan(
                                    name: MOBILE,
                                    value: 14.0,
                                  ),
                                ],
                              ).value,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // On press send message to ker
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BotNavBar(
                                      selectedIndex: 1,
                                    )));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 30, top: 10),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Customer Support',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveValue(
                    context,
                    defaultValue: 22.0,
                    valueWhen: const [
                      Condition.smallerThan(
                        name: MOBILE,
                        value: 18.0,
                      ),
                    ],
                  ).value,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Not able to resolve your issue yet, no problem at all. We are available 24/7 to assist you.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ResponsiveValue(
                    context,
                    defaultValue: 18.0,
                    valueWhen: const [
                      Condition.smallerThan(
                        name: MOBILE,
                        value: 14.0,
                      ),
                    ],
                  ).value,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 45),
                    height: 40,
                    width: ResponsiveValue(
                      context,
                      defaultValue: 170.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 160.0,
                        ),
                      ],
                    ).value,
                    // Setup box decoration for border control
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 0, 90, 172), width: 2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // create the elevated button
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 0, 90, 172)),
                      // Set the child to be a text widget with purpose of button
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveValue(
                                context,
                                defaultValue: 16.0,
                                valueWhen: const [
                                  Condition.smallerThan(
                                    name: MOBILE,
                                    value: 14.0,
                                  ),
                                ],
                              ).value,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // On press send message to ker
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BotNavBar(
                                      selectedIndex: 2,
                                    )));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 30, top: 10),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Have any questions about the app?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveValue(
                    context,
                    defaultValue: 22.0,
                    valueWhen: const [
                      Condition.smallerThan(
                        name: MOBILE,
                        value: 18.0,
                      ),
                    ],
                  ).value,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Check the FAQs for any frequently asked questions in the menu section',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ResponsiveValue(
                    context,
                    defaultValue: 18.0,
                    valueWhen: const [
                      Condition.smallerThan(
                        name: MOBILE,
                        value: 14.0,
                      ),
                    ],
                  ).value,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 45),
                    height: 40,
                    width: ResponsiveValue(
                      context,
                      defaultValue: 170.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 160.0,
                        ),
                      ],
                    ).value,
                    // Setup box decoration for border control
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 0, 90, 172), width: 2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // create the elevated button
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 0, 90, 172)),
                      // Set the child to be a text widget with purpose of button
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Take me there',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveValue(
                                context,
                                defaultValue: 16.0,
                                valueWhen: const [
                                  Condition.smallerThan(
                                    name: MOBILE,
                                    value: 14.0,
                                  ),
                                ],
                              ).value,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // On press send message to ker
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BotNavBar(
                                      selectedIndex: 3,
                                    )));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 30, top: 10),
        ),
      ],
    );
  }
}
