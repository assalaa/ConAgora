import 'package:flutter/material.dart';

const _backgroundColor = Color(0xFFF6F9FA);
const _blueColor = Color(0xFF0D1863);
const _greenColor = Color(0xFF2BBEBA);

class MainRappiConcept extends StatelessWidget {
  const MainRappiConcept({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData.light(), child: _RappiConcept());
  }
}

class _RappiConcept extends StatelessWidget {
  const _RappiConcept({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
