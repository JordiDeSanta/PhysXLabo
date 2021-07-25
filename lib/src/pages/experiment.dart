import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Experiment extends StatefulWidget {
  const Experiment({Key? key}) : super(key: key);

  @override
  _ExperimentState createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  Offset th = Offset(20, 100);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Transform.translate(
              offset: th,
              child: Draggable(
                axis: Axis.horizontal,
                child: school,
                feedback: school,
                childWhenDragging: Container(),
                onDragEnd: (dragDetails) {
                  setState(() {
                    th = Offset(dragDetails.offset.dx, th.dy);
                    print(th);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
