import 'package:flutter/material.dart';
import 'package:stacked_cards_app/models/contacts.dart';

class PhoneNumber extends StatelessWidget {
  final Contact contact;

  const PhoneNumber({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.phone_outlined,
          size: 40,
        ),
        const SizedBox(width: 10),
        Text(
          contact.phone,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
