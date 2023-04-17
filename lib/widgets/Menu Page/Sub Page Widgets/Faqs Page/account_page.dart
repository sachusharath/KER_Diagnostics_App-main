import 'package:flutter/material.dart';

class AccountFaq extends StatefulWidget {
  const AccountFaq({Key? key}) : super(key: key);

  @override
  State<AccountFaq> createState() => _AccountFaqState();
}

class _AccountFaqState extends State<AccountFaq> {
  final List<Item> _data = [
    Item(name: "Is there a free trial version available?",
        text: "Yes, you can try the app for free for 3 days. After which you will be charged monthly."),
    Item(name: "Can I change my plan later?",
        text: "Of course, you can change the plan to be billed annually, quarterly or monthly. Please submit your request through our enquiry form."),
    Item(name: "How many users are allowed with an account?",
        text: "One user is associated to one account"),
    Item(name: "What is your cancellation policy?",
        text: "We understand that things change. You can cancel your plan at any time, you will still be able to access the app until the date of expiry."),
    Item(name: "How do I change my account email?",
        text: "Account email can be changed by submitting a request form to the customer support."),
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
