import 'package:covid19_awareness_app/models/symptom.dart';
import 'package:covid19_awareness_app/ui/cells/requirement_cell.dart';
import 'package:covid19_awareness_app/ui/cells/symptom_cell.dart';
import 'package:covid19_awareness_app/ui/pages/detail_page.dart';
import 'package:covid19_awareness_app/utils/hex_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Symptom> _symptoms = List<Symptom>();

  _onSymptomCellTap(Symptom symptom) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(symptom: symptom),
        ));
  }

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  void initState() {
    super.initState();
    _symptoms = _getSymptoms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _requirementSection(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Symptomps',
                    style: TextStyle(
                      color: HexColor('#425060'),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  _symptomsGridView(),
                ],
              ),
            ),
          ),
        ],
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
      centerTitle: false,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.only(left: 24),
        child: Text(
          'Hi, Shakibul',
          style: TextStyle(
            color: HexColor('#425060'),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              alignment: Alignment.center,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Requirement Section
  Column _requirementSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: HexColor('#DDF2FF'),
          padding: EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 16),
          child: Text(
            'Requirement',
            style: TextStyle(
              color: HexColor('#425060'),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 75,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      color: HexColor('#DDF2FF'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 24,
                right: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RequirementCell(title: 'Mask', image: 'mask.png'),
                    RequirementCell(title: 'Gloves', image: 'gloves.png'),
                    RequirementCell(title: 'Alcohol', image: 'alcohol.png'),
                    RequirementCell(title: 'Soap', image: 'soap.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Symptoms GridView
  GridView _symptomsGridView() {
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: _symptoms
          .map((symptom) => SymptomCell(
                symptom: symptom,
                onTap: () => _onSymptomCellTap(symptom),
              ))
          .toList(),
    );
  }

  /// Get Symptoms
  List<Symptom> _getSymptoms() {
    List<Symptom> symptoms = List<Symptom>();
    symptoms.add(Symptom(image: 'fever.png', title: 'Fever'));
    symptoms.add(Symptom(image: 'cough.png', title: 'Cough'));
    symptoms.add(Symptom(image: 'sore-throat.png', title: 'Sore throat'));
    symptoms.add(Symptom(image: 'tiredness.png', title: 'Tiredness'));
    symptoms.add(Symptom(image: 'aches.png', title: 'Aches'));
    symptoms.add(Symptom(image: 'breath.png', title: 'Shortness breath'));
    return symptoms;
  }
}
