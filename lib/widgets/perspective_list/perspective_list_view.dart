import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked_cards_app/widgets/perspective_list/perspective_items.dart';

// Uses PageController to make work a Page Listener.
class PerspectiveListView extends StatefulWidget {
  const PerspectiveListView({
    super.key,
    required this.visualizedItems,
    required this.itemExtent,
    required this.children,
    this.initialIndex = 0,
    this.padding = EdgeInsets.zero,
    this.onTapFrontItem,
    this.onChangeFrontItem,
    this.backItemsShadowColor = Colors.transparent,
    this.enableBackItemsShadow = false,
  });

  final List<Widget> children;
  final double? itemExtent;
  final int? visualizedItems;
  final int initialIndex;
  final EdgeInsetsGeometry padding;
  final ValueChanged<int?>? onTapFrontItem;
  final ValueChanged<int>? onChangeFrontItem;
  final Color backItemsShadowColor;
  final bool enableBackItemsShadow;

  @override
  PerspectiveListViewState createState() => PerspectiveListViewState();
}

class PerspectiveListViewState extends State<PerspectiveListView> {
  PageController? _pageController;
  int? _currentItemIndex;
  double? _closestItemPercent;

  @override
  void initState() {
    _currentItemIndex = widget.initialIndex;
    _pageController = PageController(
      viewportFraction: 1 / widget.visualizedItems!,
      initialPage: _currentItemIndex!,
    );
    _closestItemPercent = 0.0;
    _pageController!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  // The Page Listener is used for getting values; these values will be useful to generate the animations and transforms for every item seen in the view.
  void _pageListener() {
    _currentItemIndex = _pageController!.page!.floor();
    _closestItemPercent = (_pageController!.page! - _currentItemIndex!).abs();
    setState(() {});

    // In this case, item = card
    if (kDebugMode) {
      print("Page scroll current value: ${_pageController!.page!}");
      print("Current item index: ${_currentItemIndex.toString()}");
      print("Percent of showing of closest item: ${_closestItemPercent.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // To understand LayoutBuilder, see: https://www.youtube.com/watch?v=IYDVcriKjsw
    // In summary, LayoutBuilder is helpful to responsive design since you can build conditions using constraints like maxWidth.
    return LayoutBuilder(
      builder: (_, constraints) {
        final height = constraints.maxHeight;
        return Stack(
          children: [
            // Perspective Items List: this generates the list of items (contact cards in this case). This component already implements animations for the cards.
            Padding(
              padding: widget.padding,
              child: PerspectiveItems(
                generatedItems: widget.visualizedItems! - 1,
                currentIndex: _currentItemIndex,
                heightItem: widget.itemExtent,
                pagePercent: _closestItemPercent,
                children: widget.children,
              ),
            ),
            // Back Items Shadow: this generates a soft shadow under the appbar that extends to the bottom of the screen. This gives a distance effect.
            if (widget.enableBackItemsShadow)
              Positioned.fill(
                bottom: widget.itemExtent,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        widget.backItemsShadowColor.withOpacity(0.8),
                        widget.backItemsShadowColor.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
            // Void Page View: this makes the cards scrollable.
            PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              onPageChanged: widget.onChangeFrontItem?.call,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.children.length,
              itemBuilder: (context, index) {
                return const SizedBox();
              },
            ),
            // On Tap Item Area: this makes all of the cards clickable/tapable. A callback is executed when a card is clicked/tapped.
            Positioned.fill(
              top: height - widget.itemExtent!,
              child: GestureDetector(
                onTap: () => widget.onTapFrontItem?.call(_currentItemIndex),
              ),
            )
          ],
        );
      },
    );
  }
}
