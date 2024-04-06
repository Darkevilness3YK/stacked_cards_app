import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked_cards_app/widgets/perspective_list/transformed_item.dart';

// Validates conditions for generating animations for items according their indexes. Takes the values given by the Page Listener in perspective_list_view.dart
class PerspectiveItems extends StatelessWidget {
  const PerspectiveItems({
    super.key,
    required this.generatedItems,
    required this.currentIndex,
    required this.heightItem,
    required this.pagePercent,
    required this.children,
  });

  final int generatedItems;
  final int? currentIndex;
  final double? heightItem;
  final double? pagePercent;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        return Stack(
          fit: StackFit.expand,
          children: [
            // Static First Item: this animation makes the first visible item (the farthest one) be static until the next one replaces it.
            if (currentIndex! > (generatedItems - 1))
              TransformedItem(
                heightItem: heightItem,
                factorChange: 1,
                endScale: 0.5,
                child: children[currentIndex! - generatedItems],
              )
            else
              const SizedBox(),
            // Perspective Items: this is the animation the items will do when they aren't neither the first or the last: items will come closer when the screen is being slided down, and they will go far when the screen is being slided up.
            for (int index = 0; index < generatedItems; index++)
              if (currentIndex! > ((generatedItems - 2) - index))
                TransformedItem(
                  heightItem: heightItem,
                  factorChange: pagePercent,
                  scale: lerpDouble(0.5, 1, (index + 1) / generatedItems),
                  translateY: (height - heightItem!) * (index + 1) / generatedItems,
                  endScale: lerpDouble(0.5, 1, index / generatedItems),
                  endTranslateY: (height - heightItem!) * (index / generatedItems),
                  child: children[currentIndex! - (((generatedItems - 2) - index) + 1)],
                )
              else
                const SizedBox(),
            // Bottom Hide Item: this is the animation the items will do when they fades in or out from the bottom of the screen.
            if (currentIndex! < (children.length - 1))
              TransformedItem(
                heightItem: heightItem,
                factorChange: pagePercent,
                translateY: height + 20,
                endTranslateY: height - heightItem!,
                child: children[currentIndex! + 1],
              )
            else
              const SizedBox()
          ],
        );
      },
    );
  }
}
