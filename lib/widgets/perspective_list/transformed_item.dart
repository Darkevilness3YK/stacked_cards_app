import 'dart:ui';

import 'package:flutter/material.dart';

// Generates an animation for the item using passed values from perspective_items.dart
class TransformedItem extends StatelessWidget {
  const TransformedItem({
    super.key,
    required this.heightItem,
    required this.child,
    required this.factorChange,
    this.endScale = 1.0,
    this.scale = 1.0,
    this.endTranslateY = 0.0,
    this.translateY = 0.0,
  });

  final Widget child;
  final double? heightItem;
  final double? factorChange;
  final double? endScale;
  final double endTranslateY;
  final double translateY;
  final double? scale;

  @override
  Widget build(BuildContext context) {
    // To understand Transform and Matrix4 methods, see: https://www.youtube.com/watch?v=mL6cQLzXm0s
    // To understand lerp function, see: https://www.youtube.com/shorts/X_lyWZGoPCY
    return Transform(
      alignment: Alignment.topCenter,
      // In this Widget:
      //  Scale gives the perspective effect, since each item is scaled individually according to page listener values, so some items will be bigger than others.
      //  Translate gives up and down animations, since each item's position are set individually according to page listener values.
      transform: Matrix4.identity()
        ..scale(lerpDouble(scale, endScale, factorChange!))
        ..translate(
          0.0,
          lerpDouble(translateY, endTranslateY, factorChange!)!,
        ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: heightItem,
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
