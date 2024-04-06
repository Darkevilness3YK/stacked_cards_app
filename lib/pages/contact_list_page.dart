import 'package:flutter/material.dart';
import 'package:stacked_cards_app/models/contacts.dart';
import 'package:stacked_cards_app/widgets/contact_card/contact_card.dart';
import 'package:stacked_cards_app/widgets/contact_card/contact_card_detail.dart';
import 'package:stacked_cards_app/widgets/perspective_list/perspective_list_view.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  ContactListPageState createState() => ContactListPageState();
}

class ContactListPageState extends State<ContactListPage> {
  // These values are get from sliders inside the drawer.
  int? _visibleItems;
  double? _itemExtent;

  @override
  void initState() {
    _visibleItems = 8;
    _itemExtent = 270.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const Color defaultSliderActiveColor = Color(0xFF77A9FF);
    const Color defaultSliderInactiveColor = Color(0xFFB9D3FF);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text(
          'Contacts',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: PerspectiveListView(
        visualizedItems: _visibleItems,
        itemExtent: _itemExtent,
        initialIndex: 7,
        enableBackItemsShadow: true,
        backItemsShadowColor: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(10),
        onTapFrontItem: (index) {
          final color = Colors.accents[index! % Colors.accents.length];
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (_) => ContactCardDetailScreen(
                contact: Contact.contacts[index],
                color: color,
              ),
            ),
          );
        },
        children: List.generate(Contact.contacts.length, (index) {
          final borderColor = Colors.accents[index % Colors.accents.length];
          final contact = Contact.contacts[index];
          return ContactCard(
            borderColor: borderColor,
            contact: contact,
          );
        }),
      ),
      // Drawer (lateral menu)
      drawer: Drawer(
        child: Material(
          textStyle: const TextStyle(color: Colors.white, fontSize: 16),
          child: Container(
            color: Colors.blueAccent[400],
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drawer title
                  const Row(
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        '  Settings',
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 40),
                  // Visible Items Control: how many items will be visible at the same time on the screen.
                  Row(
                    children: [
                      const Icon(
                        Icons.visibility_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                      const Text(
                        '   Visible items',
                        style: TextStyle(),
                      ),
                      Expanded(
                        child: Slider(
                          value: _visibleItems!.toDouble(),
                          min: 1,
                          max: 15,
                          divisions: 15,
                          label: '$_visibleItems',
                          activeColor: defaultSliderActiveColor,
                          inactiveColor: defaultSliderInactiveColor,
                          onChanged: (value) {
                            setState(() {
                              _visibleItems = value.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const Divider(height: 40),
                  // Item Extent Control: separation between items.
                  Row(
                    children: [
                      const Icon(
                        Icons.widgets,
                        color: Colors.white,
                        size: 16,
                      ),
                      const Text(
                        '   Item Extent',
                        style: TextStyle(),
                      ),
                      Expanded(
                        child: Slider(
                          value: _itemExtent!,
                          min: 270,
                          max: MediaQuery.of(context).size.height * .8,
                          label: '$_itemExtent',
                          activeColor: defaultSliderActiveColor,
                          inactiveColor: defaultSliderInactiveColor,
                          onChanged: (value) {
                            setState(() {
                              _itemExtent = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const Divider(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
