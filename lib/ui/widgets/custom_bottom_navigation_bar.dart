import 'package:covid19_awareness_app/ui/widgets/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomBottomNavigationBarItem> items;
  final int selectedIndex;

  const CustomBottomNavigationBar({
    Key key,
    @required this.items,
    this.selectedIndex = 0,
  })  : assert(items != null),
        assert(items.length >= 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: Offset(0, -1),
            blurRadius: 6,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items,
      ),
    );
  }
}
