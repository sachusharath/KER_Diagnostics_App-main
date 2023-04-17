import 'package:flutter/material.dart';

class GeneralFaq extends StatefulWidget {
  const GeneralFaq({Key? key}) : super(key: key);

  @override
  State<GeneralFaq> createState() => _GeneralFaqState();
}

class _GeneralFaqState extends State<GeneralFaq> {
  final List<Item> _data = [
    Item(name: "How does billing work?",
        text: "Bills are generated upon payment and a copy is provided through the email provided."),
    Item(name: "Can other info be added to an invoice?",
        text: "Please contact us through any of the helpline provided in the app to add more information to an invoice."),
    Item(name: "Which devices can I use the app on?",
        text: "The app is supported on Android and iOS mobile devices and tablets."),
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
