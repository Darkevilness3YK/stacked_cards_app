import 'package:flutter/material.dart';
import 'package:stacked_cards_app/models/contacts.dart';
import 'package:stacked_cards_app/widgets/contact_card/contact_card.dart';

class ContactCardDetailScreen extends StatelessWidget {
  const ContactCardDetailScreen({
    super.key,
    required this.contact,
    required this.color,
  });

  final Contact contact;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: ContactCard(
            contact: contact,
            borderColor: color,
          ),
        ),
      ),
    );
  }
}
