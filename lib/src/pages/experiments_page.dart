import 'package:flutter/material.dart';

class ExperimentsPage extends StatelessWidget {
  const ExperimentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'experiment');
            },
            child: Text('School Skater'),
          ),
        ],
      ),
    );
  }
}
