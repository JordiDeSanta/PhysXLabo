import 'package:flutter/material.dart';
import 'package:physxlab/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhysXLab',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
