import 'package:flutter/material.dart';

class CardTab extends StatelessWidget {
  final Color borderColor;

  const CardTab({
    super.key,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: .9,
      alignment: Alignment.centerLeft,
      child: Container(
        height: 30,
        width: 70,
        decoration: BoxDecoration(
          color: borderColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
