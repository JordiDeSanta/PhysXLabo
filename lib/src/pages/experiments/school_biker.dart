import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Experiment extends StatefulWidget {
  const Experiment({Key? key}) : super(key: key);

  @override
  _ExperimentState createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  double _distance = 2;
  double _velocity = 2;

  Widget _horizontalSeparator(double h) {
    return SizedBox(height: h);
  }

  Widget _objects() {
    final school = Icon(
      FontAwesomeIcons.school,
      size: 80,
    );
    final biker = Icon(
      FontAwesomeIcons.biking,
      size: 50,
    );

    return Row(
      children: [
        SizedBox(width: 10),
        biker,
        Transform.translate(
          offset: Offset(_distance * 9 + 50, -15),
          child: school,
        ),
      ],
    );
  }

  Widget _sliders() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text('Distance'),
              Expanded(
                child: Slider(
                  divisions: 9,
                  max: 10,
                  min: 1,
                  value: _distance,
                  onChanged: (distance) {
                    setState(() {
                      _distance = distance;
                    });
                  },
                ),
              ),
              Text(_distance.toString() + ' km'),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text('Velocity  '),
              Expanded(
                child: Slider(
                  divisions: 9,
                  max: 10,
                  min: 1,
                  value: _velocity,
                  onChanged: (velocity) {
                    setState(() {
                      _velocity = velocity;
                    });
                  },
                ),
              ),
              Text(_velocity.toString() + ' m/s'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _header(TextTheme textTheme) {
    return Column(
      children: [
        _horizontalSeparator(15),
        Text(
          'How long will it take Joe to get to school?',
          style: textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
        ),
        _horizontalSeparator(30),
      ],
    );
  }

  Widget _explanation(TextTheme textTheme, double distanceInMeters) {
    return Column(
      children: [
        Text(
          'First, convert all the unities to the International System',
          style: textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
        ),
        _horizontalSeparator(10),
        Text(
          '$_distance km =  ${_distance * 1000} m',
          style: textTheme.headline6,
        ),
        Text(
          '\nUse the formula triangle',
          style: textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
        ),
        _horizontalSeparator(10),
        Row(
          children: [
            SizedBox(width: 30),
            Image(
              image: AssetImage('assets/img/dtv.png'),
              height: 80,
            ),
            Icon(Icons.arrow_right),
            Text('   t = ', style: textTheme.headline6),
            Column(
              children: [
                Text('d', style: textTheme.headline6),
                Icon(Icons.horizontal_rule),
                Text('v', style: textTheme.headline6),
              ],
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_right),
            Column(
              children: [
                Text('${_distance * 1000} m', style: textTheme.headline6),
                Icon(Icons.horizontal_rule),
                Text('$_velocity m/s', style: textTheme.headline6),
              ],
            ),
          ],
        ),
        _horizontalSeparator(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'The meters (unit of length) are cancelled in the division and the seconds (unit of time) remain in the result',
            style: textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        _horizontalSeparator(10),
        Text('${distanceInMeters / _velocity} s', style: textTheme.headline6),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double _distanceInMeters = _distance * 1000;

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'School Biker',
          style: textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(textTheme),
            _objects(),
            _sliders(),
            _explanation(textTheme, _distanceInMeters),
          ],
        ),
      ),
    );
  }
}
