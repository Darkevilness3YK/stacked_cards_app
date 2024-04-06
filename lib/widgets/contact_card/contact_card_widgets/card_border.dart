import 'package:flutter/material.dart';

class CardBorder extends StatelessWidget {
  final Color borderColor;
  final Widget cardBody;

  const CardBorder({
    super.key,
    required this.borderColor,
    required this.cardBody,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: borderColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: cardBody,
      ),
    );
  }
}
