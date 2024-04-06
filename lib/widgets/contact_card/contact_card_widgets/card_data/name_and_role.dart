import 'package:flutter/material.dart';
import 'package:stacked_cards_app/models/contacts.dart';

class NameAndRole extends StatelessWidget {
  final Contact contact;

  const NameAndRole({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.person_outlined,
          size: 40,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text.rich(
            TextSpan(
              text: contact.name,
              children: [
                TextSpan(
                  text: '\n${contact.role}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                )
              ],
            ),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
