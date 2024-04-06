import 'package:flutter/material.dart';
import 'package:stacked_cards_app/models/contacts.dart';

class Email extends StatelessWidget {
  final Contact contact;

  const Email({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.email_outlined,
          size: 40,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  contact.email,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Text(
                contact.website,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
