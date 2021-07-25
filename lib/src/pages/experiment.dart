import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Experiment extends StatefulWidget {
  const Experiment({Key? key}) : super(key: key);

  @override
  _ExperimentState createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    double xPos = 20;
    final school = Icon(
      FontAwesomeIcons.school,
      size: 80,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'School Biker',
          style: textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Icon(
            FontAwesomeIcons.biking,
            size: 50,
          ),
          Transform.translate(
            offset: Offset(xPos, 100),
            child: Draggable<Icon>(
              axis: Axis.horizontal,
              feedback: school,
              data: school,
              child: school,
              childWhenDragging: Container(),
              onDragEnd: (details) {
                details.offset;
              },
            ),
          ),
        ],
      ),
    );
  }
}
