import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Experiment extends StatefulWidget {
  const Experiment({Key? key}) : super(key: key);

  @override
  _ExperimentState createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  Offset th = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    final textTheme = Theme.of(context).textTheme;

    final school = Icon(
      FontAwesomeIcons.school,
      size: 80,
    );

    final biker = Icon(
      FontAwesomeIcons.biking,
      size: 50,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'School Biker',
          style: textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              biker,
              Transform.translate(offset: th, child: school),
            ],
          ),
        ],
      ),
    );
  }
}
