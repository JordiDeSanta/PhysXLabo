import 'package:flutter/material.dart';

class AxisPage extends StatelessWidget {
  const AxisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'experiments');
            },
            child: Text('Uniform Motion'),
          ),
        ],
      ),
    );
  }
}
