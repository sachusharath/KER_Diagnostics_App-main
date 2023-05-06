import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ker_diagnostics_app/constants.dart';
import 'package:ker_diagnostics_app/widgets/Diagnostic%20Dialog/Circ%20Pump%20Dialog/circ_pump_dialog.dart';
import 'package:ker_diagnostics_app/widgets/Diagnostic%20Dialog/Compressor%20Dialog/comp_dialog.dart';
import 'package:ker_diagnostics_app/widgets/Diagnostic%20Dialog/Condenser%20Dialog/condenser_dialog.dart';
import 'package:ker_diagnostics_app/widgets/Diagnostic%20Dialog/Cooler%20Dialog/cooler_dialog.dart';
import 'package:ker_diagnostics_app/widgets/Diagnostic%20Dialog/Inverter%20Dialog/inverter_dialog.dart';
import 'package:ker_diagnostics_app/widgets/Diagnostic%20Dialog/Mixed%20Dialog/mixed_dialog.dart';
import 'package:ker_diagnostics_app/widgets/Diagnostic%20Dialog/Panel%20Dialog/panel_dialog.dart';
import 'package:ker_diagnostics_app/widgets/Diagnostic%20Dialog/Tank%20Dialog/tank_dialog.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../troubleshootModel.dart';

class DiagnosticMenu extends StatelessWidget {
  const DiagnosticMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuBuilder();
  }
}

class MenuBuilder extends StatefulWidget {
  const MenuBuilder({Key? key}) : super(key: key);

  @override
  State<MenuBuilder> createState() => _MenuBuilderState();
}

class _MenuBuilderState extends State<MenuBuilder> {
  @override
  Widget build(BuildContext context) {
    double spacer = ResponsiveValue(
      context,
      defaultValue: 120.0,
      valueWhen: const [
        Condition.smallerThan(
          name: MOBILE,
          value: 60.0,
        ),
      ],
    ).value as double;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 185,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Self-Checks',
                        style: TextStyle(
                            fontSize: ResponsiveValue(
                              context,
                              defaultValue: 19.0,
                              valueWhen: const [
                                Condition.smallerThan(
                                  name: MOBILE,
                                  value: 16.0,
                                ),
                              ],
                            ).value,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: ResponsiveValue(
                          context,
                          defaultValue: 24.0,
                          valueWhen: const [
                            Condition.smallerThan(
                              name: MOBILE,
                              value: 15.0,
                            ),
                          ],
                        ).value,
                        width: ResponsiveValue(
                          context,
                          defaultValue: 36.0,
                          valueWhen: const [
                            Condition.smallerThan(
                              name: MOBILE,
                              value: 25.0,
                            ),
                          ],
                        ).value,
                        /*child: Image(
                          image: AssetImage('assets/images/freeBadge.JPG'),
                        ),*/
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Assess your vessel status in 5 minutes',
                    style: TextStyle(
                      fontSize: ResponsiveValue(
                        context,
                        defaultValue: 16.0,
                        valueWhen: const [
                          Condition.smallerThan(
                            name: MOBILE,
                            value: 15.0,
                          ),
                        ],
                      ).value,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          partLists()
        ],
      ),
    );
  }

  Widget partLists() {
    List<Troubleshoot> troubleshootData =
        (json.decode(Constants.jsonValue) as List)
            .map((i) => Troubleshoot.fromJson(i))
            .toList();
    return parentGridViewDevice(troubleshootData);
  }

  Widget parentGridViewDevice(List<Troubleshoot> troubleshootData) {
    return Container(
      height: 500,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: troubleshootData.length,
          itemBuilder: (BuildContext ctx, index) {
            return gridViewChild(troubleshootData.elementAt(index));
          }),
    );
  }

  Widget parentGridViewSymptoms(List<Symptoms> symptomsData) {
    return Container(
      height: 500,
      margin: EdgeInsets.only(top: 30),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: symptomsData.length,
          itemBuilder: (BuildContext ctx, index) {
            return symptomsItemView(symptomsData.elementAt(index));
          }),
    );
  }

  Widget parentListViewCause(List<Causes> causeData) {
    return Container(
      height: 500,
      margin: EdgeInsets.only(top: 30),
      child: ListView.builder(
          itemCount: causeData.length,
          itemBuilder: (BuildContext ctx, index) {
            return causeFixItemView(causeData.elementAt(index), index + 1);
          }),
    );
  }

  Widget parentGridViewParts(List<Parts> troubleshootData) {
    return Container(
      height: 500,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: troubleshootData.length,
          itemBuilder: (BuildContext ctx, index) {
            return gridViewPartsChild(troubleshootData.elementAt(index));
          }),
    );
  }

  readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = json.decode(response);
    return data;
  }

  Widget gridViewChild(Troubleshoot troubleShoot) {
    return GestureDetector(
      child: Card(
        child: Column(
          children: [
            // create a container child
            Container(
              width: 60,
              height: 60,
              child: Image.asset(troubleShoot.deviceImage!),
            ),
            Text(
              troubleShoot.deviceName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: ResponsiveValue(
                  context,
                  defaultValue: 19.0,
                  valueWhen: const [
                    Condition.smallerThan(
                      name: MOBILE,
                      value: 16.0,
                    ),
                  ],
                ).value,
              ),
            ),
          ],
        ),
      ),
      onTap: () => {onTapClicked(troubleShoot.parts)},
    );
  }

  Widget gridViewPartsChild(Parts partsData) {
    return GestureDetector(
      child: Column(
        children: [
          // create a container child
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 60,
            height: 60,
            child: Image.asset(partsData.partsImage!),
          ),
          Text(
            partsData.partsName!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: ResponsiveValue(
                context,
                defaultValue: 19.0,
                valueWhen: const [
                  Condition.smallerThan(
                    name: MOBILE,
                    value: 16.0,
                  ),
                ],
              ).value,
            ),
          ),
        ],
      ),
      onTap: () => {
        onGridViewPartsChildClicked(partsData),
      },
    );
  }

  void onTapClicked(List<Parts>? parts) {
    showPartsDialog(parts);
  }

  Widget symptomsItemView(Symptoms symptoms) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(width: 2.5, color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 0, 90, 172),
        textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        onSymptomsClicked(symptoms.causes!);
      },
      child: Align(
          alignment: Alignment.center,
          child: Text(
            symptoms.symptomsName!,
            textAlign: TextAlign.center,
          )),
    );
  }

  Widget causeFixItemView(Causes causes, int index) {
    return Card(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Cause $index :",
                style: TextStyle(color: Color.fromARGB(255, 0, 90, 172)),
              ),
              SizedBox(height: 10),
              Text(
                causes.causeName!,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                "Fix :",
                style: TextStyle(color: Color.fromARGB(255, 0, 90, 172)),
              ),
              SizedBox(height: 10),
              Text(
                causes.fixesName!,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
            ],
          ),
        ));
  }

  Future<Null> showPartsDialog(List<Parts>? parts) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.only(left: 10.0, bottom: 10, right: 10),
          title: Row(
            children: [
              Flexible(
                flex: 15,
                child: Text(
                  'Select the part which you want to diagnose',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              Flexible(child: _getCloseButton(context), flex: 2),
            ],
          ),
          content: Container(
            // Specify some width
            width: MediaQuery.of(context).size.width * .7,
            child: parentGridViewParts(parts!),
          ),
        );
      },
    );
  }

  Future<Null> showCauseFixDialog(List<Causes> causeData) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.only(left: 10.0, bottom: 10, right: 10),
          title: Row(
            children: [
              Flexible(
                flex: 15,
                child: Text(
                  'Displayed below is the list of causes and fixes. If none of them works, please contact KER',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              Flexible(child: _getCloseButton(context), flex: 2),
            ],
          ),
          content: Container(
            // Specify some width
            width: MediaQuery.of(context).size.width * .7,
            child: parentListViewCause(causeData),
          ),
        );
      },
    );
  }

  Future<Null> showSymptomsDialog(List<Symptoms> symptoms) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.only(left: 10.0, bottom: 10, right: 10),
          title: Row(
            children: [
              Flexible(
                flex: 15,
                child: Text(
                  'Which of the following options best describes your problem?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              Flexible(child: _getCloseButton(context), flex: 2),
            ],
          ),
          content: Container(
            // Specify some width
            width: MediaQuery.of(context).size.width * .7,
            child: parentGridViewSymptoms(symptoms),
          ),
        );
      },
    );
  }

  _getCloseButton(context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Icon(
            Icons.clear,
            color: Colors.red,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget backupWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                _buildButton("assets/images/rsw_compressor.jpg", 75, "comp"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Compressor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 19.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 16.0,
                        ),
                      ],
                    ).value,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _buildButton("assets/images/circ_pump.jpg", 80, "circ"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Circ Pump',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 19.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 16.0,
                        ),
                      ],
                    ).value,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _buildButton("assets/images/cond_pump.jpg", 100, "cond"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Condensor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 19.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 16.0,
                        ),
                      ],
                    ).value,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                _buildButton("assets/images/cooler_rsw.jpg", 95, "cool"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Cooler',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 19.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 16.0,
                        ),
                      ],
                    ).value,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _buildButton("assets/images/antarctic.jpg", 75, "tank"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Tank',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 19.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 16.0,
                        ),
                      ],
                    ).value,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _buildButton("assets/images/inverter.jpg", 65, "inv"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Inverter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 19.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 16.0,
                        ),
                      ],
                    ).value,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Wrap(
          children: [
            Column(
              children: [
                _buildButton("assets/images/panel.JPG", 50, "panel"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Panel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 19.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 16.0,
                        ),
                      ],
                    ).value,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _buildButton("assets/images/rsw_plant.jpg", 65, "mixed"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Mixed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 19.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 16.0,
                        ),
                      ],
                    ).value,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

// function to build a button
  _buildButton(String image, double width, String type) {
    // choice set to type behind each button
    String choice = type;
    // return a transform
    return Stack(
      children: [
        Container(
          // height  and width of button
          height: ResponsiveValue(
            context,
            defaultValue: 120.0,
            valueWhen: const [
              Condition.smallerThan(
                name: MOBILE,
                value: 90.0,
              ),
            ],
          ).value,
          width: ResponsiveValue(
            context,
            defaultValue: 120.0,
            valueWhen: const [
              Condition.smallerThan(
                name: MOBILE,
                value: 90.0,
              ),
            ],
          ).value,
          // use an extended FAB to fit everything in the circle
          child: FloatingActionButton.extended(
            heroTag: null,
            elevation: 0,
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            // entended allows for use of label and set it as a column
            label: Column(
              children: [
                // create a container child
                Container(
                  // set the width of the image to width from param
                  width: ResponsiveValue(
                    context,
                    defaultValue: width + 16,
                    valueWhen: [
                      Condition.smallerThan(
                        name: MOBILE,
                        value: width,
                      ),
                    ],
                  ).value,
                  // set child to asset image using image param
                  child: Image.asset(image),
                ),
              ],
            ),
            // set background color to white
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            // on pressed call menu choice function and pass in choice
            onPressed: () => {onPressEvent(context, choice)},
          ),
        ),
      ],
    );
  }

  onGridViewPartsChildClicked(Parts partsData) {
    Navigator.pop(context);
    showSymptomsDialog(partsData.symptoms!);
  }

  void onSymptomsClicked(List<Causes> causeData) {
    Navigator.pop(context);
    showCauseFixDialog(causeData);
  }
}

onPressEvent(BuildContext context, String choice) {
  print("choice: " + choice);
  switch (choice) {
    case "comp":
      {
        openCompDialog(context);
      }
      break;

    case "circ":
      {
        openCircPumpDialog(context);
      }
      break;

    case "cond":
      {
        openCondenserDialog(context);
      }
      break;

    case "cool":
      {
        openCoolerDialog(context);
      }
      break;

    case "tank":
      {
        openTankDialog(context);
      }
      break;

    case "inv":
      {
        openInverterDialog(context);
      }
      break;

    case "panel":
      {
        openPanelDialog(context);
      }
      break;

    case "mixed":
      {
        openMixedDialog(context);
      }
      break;

    default:
      {
        print("failed");
      }
  }
}
