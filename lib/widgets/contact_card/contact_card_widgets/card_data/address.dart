import 'package:flutter/material.dart';
import 'package:stacked_cards_app/models/contacts.dart';

class Address extends StatelessWidget {
  final Contact contact;

  const Address({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.home_outlined,
          size: 40,
        ),
        const SizedBox(width: 10),
        Text(
          contact.address,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.deepPurple,
          ),
        )
      ],
    );
  }
}
