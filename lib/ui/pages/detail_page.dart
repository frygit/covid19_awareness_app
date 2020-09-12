import 'package:covid19_awareness_app/models/symptom.dart';
import 'package:covid19_awareness_app/utils/custom_icons_icons.dart';
import 'package:covid19_awareness_app/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:covid19_awareness_app/utils/extensions.dart';

class DetailPage extends StatefulWidget {
  final Symptom symptom;

  const DetailPage({Key key, @required this.symptom}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        color: HexColor('#DDF2FF'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.7,
              child: AspectRatio(
                aspectRatio: 86 / 110,
                child: Hero(
                  tag: widget.symptom.title.toSlug(),
                  child: Image(
                    image: AssetImage('assets/images/' + widget.symptom.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 44,
            ),
            Text(
              '03:20',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HexColor('#425060'),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (MediaQuery.of(context).size.width * 0.4) / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(CustomIcons.previous,
                      size: 24, color: HexColor('#425060')),
                  Icon(CustomIcons.pause, size: 24, color: HexColor('#425060')),
                  Icon(CustomIcons.next, size: 24, color: HexColor('#425060')),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            _detailsSection(),
          ],
        ),
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// App Bar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: HexColor('#DDF2FF'),
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: HexColor('#425060')),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(CustomIcons.volume),
        ),
      ],
    );
  }

  /// Details Section
  Expanded _detailsSection() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(46),
            topRight: Radius.circular(46),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        widget.symptom.title + ' Treatment',
                        style: TextStyle(
                          color: HexColor('#425060'),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '5.00 min',
                        style: TextStyle(
                          color: HexColor('#6F7894'),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            'Easy Pose (Sukhasana): Come into a seated position with hips on the floor. Criss-Cross the legs at the shins. Place the hands on the knees in Gyan Mudra. Lengthen the body from the crown of the head to the pelvis. Draw the shoulders back and lift the chest.',
                            style: TextStyle(
                              color: HexColor('#6F7894'),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: FlatButton(
                    color: HexColor('#DDF2FF'),
                    onPressed: () => print('Done Button Pressed'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: HexColor('#425060'),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
