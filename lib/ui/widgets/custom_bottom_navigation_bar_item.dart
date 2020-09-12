import 'package:covid19_awareness_app/utils/hex_color.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final Function onTap;

  const CustomBottomNavigationBarItem({
    Key key,
    this.isSelected = false,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? HexColor('#E0F3FF'): Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isSelected ? HexColor('#83CBF8') : HexColor('#C7CFDC'),
          size: 20,
        ),
        onPressed: () => onTap(),
      ),
    );
  }
}
