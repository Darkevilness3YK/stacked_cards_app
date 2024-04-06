import 'package:flutter/material.dart';
import 'package:stacked_cards_app/models/contacts.dart';
import 'package:stacked_cards_app/widgets/contact_card/contact_card_widgets/card_body.dart';
import 'package:stacked_cards_app/widgets/contact_card/contact_card_widgets/card_border.dart';
import 'package:stacked_cards_app/widgets/contact_card/contact_card_widgets/card_tab.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.borderColor,
    required this.contact,
  });

  final Color borderColor;
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: contact.name,
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardTab(borderColor: borderColor),
            CardBorder(
              borderColor: borderColor,
              cardBody: CardBody(
                contact: contact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
