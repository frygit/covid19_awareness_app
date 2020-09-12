import 'package:covid19_awareness_app/utils/hex_color.dart';
import 'package:flutter/material.dart';

class RequirementCell extends StatelessWidget {
  final String title;
  final String image;
  final double size;
  final double _iconSize;

  const RequirementCell({
    Key key,
    @required this.title,
    @required this.image,
    this.size = 70,
  })  : _iconSize = size * 0.4,
        super(key: key);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size / 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: _iconSize,
            height: _iconSize,
            child: Image(
              image: AssetImage('assets/images/' + image),
              fit: BoxFit.contain,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: HexColor('#425060'),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
