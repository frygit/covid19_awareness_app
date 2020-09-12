import 'package:covid19_awareness_app/models/symptom.dart';
import 'package:covid19_awareness_app/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:covid19_awareness_app/utils/extensions.dart';

class SymptomCell extends StatelessWidget {
  final Symptom symptom;
  final Function onTap;

  const SymptomCell({
    Key key,
    @required this.symptom,
    @required this.onTap,
  }) : super(key: key);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: HexColor('#E8F6FF'),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: constraints.maxHeight / 1.4,
                child: AspectRatio(
                  aspectRatio: 86 / 110,
                  child: Hero(
                    tag: symptom.title.toSlug(),
                    child: Image(
                      image: AssetImage('assets/images/' + symptom.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Text(
                symptom.title,
                style: TextStyle(
                  color: HexColor('#425060'),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
