import 'package:flutter/material.dart';

class DiagnoseFaq extends StatefulWidget {
  const DiagnoseFaq({Key? key}) : super(key: key);

  @override
  State<DiagnoseFaq> createState() => _DiagnoseFaqState();
}

class _DiagnoseFaqState extends State<DiagnoseFaq> {
  final List<Item> _data = [
    Item(name: "I did not find my issue in the tool.",
        text: "Please contact our support team for any additional issues."),
    Item(name: "How do I use the tool?",
        text: "A user guide manual is provided with the diagnose page on how to use the tool."),
    Item(name: "The issue is not yet fixed after trying the fixes.",
        text: "Our Engineers are always here to assist you. Please report the case."),
  ];

  @override
  Widget build(BuildContext context) {
    return bodyContent();
  }

  bodyContent() {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        elevation: 1,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        expandedHeaderPadding: EdgeInsets.only(bottom: 0),
        animationDuration: const Duration(seconds: 1),
        children: _data.map<ExpansionPanel>(
          (Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    item.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              },
              body: ListTile(
                title: Text(
                  item.text,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                tileColor: Color.fromARGB(255, 0, 90, 172),
                contentPadding: const EdgeInsets.all(20),
              ),
              isExpanded: item.isExpanded,
              canTapOnHeader: true,
            );
          },
        ).toList(),
      ),
    );
  }
}

class Item {
  String name;
  String text;
  bool isExpanded = false;
  Item({required this.name, required this.text});
}
