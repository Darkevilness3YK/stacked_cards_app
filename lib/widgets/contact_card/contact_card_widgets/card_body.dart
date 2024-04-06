import 'package:flutter/material.dart';
import 'package:stacked_cards_app/models/contacts.dart';
import 'package:stacked_cards_app/widgets/contact_card/contact_card_widgets/card_data/address.dart';
import 'package:stacked_cards_app/widgets/contact_card/contact_card_widgets/card_data/email.dart';
import 'package:stacked_cards_app/widgets/contact_card/contact_card_widgets/card_data/name_and_role.dart';
import 'package:stacked_cards_app/widgets/contact_card/contact_card_widgets/card_data/phone_number.dart';

class CardBody extends StatelessWidget {
  final Contact contact;

  const CardBody({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameAndRole(contact: contact),
          Address(contact: contact),
          PhoneNumber(contact: contact),
          Email(contact: contact),
        ],
      ),
    );
  }
}
