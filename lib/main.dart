import 'package:flutter/material.dart';

import 'package:physxlab/src/pages/home_page.dart';
import 'package:physxlab/src/utils/custom_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final customColors = CustomColors();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhysXLab',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
      },
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: customColors.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: customColors.buttonsColor,
        ),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Mathematical',
            fontSize: 60,
            color: customColors.iconsColor,
          ),
        ),
      ),
    );
  }
}
