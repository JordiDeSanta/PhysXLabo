import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:physxlab/src/pages/axis_page.dart';
import 'package:physxlab/src/pages/experiment.dart';
import 'package:physxlab/src/pages/experiments_page.dart';
import 'package:physxlab/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.dark().copyWith(
      background: ThemeData.dark().scaffoldBackgroundColor,
      primary: Colors.black38,
      secondary: Color.fromARGB(255, 94, 226, 240),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhysXLab',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'axis': (context) => AxisPage(),
        'experiments': (context) => ExperimentsPage(),
        'experiment': (context) => Experiment(),
      },
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: colorScheme.background,
        appBarTheme: AppBarTheme(
          color: colorScheme.primary,
          centerTitle: true,
          iconTheme: IconThemeData(color: colorScheme.secondary),
        ),
        colorScheme: colorScheme,
        textTheme: GoogleFonts.openSansCondensedTextTheme().copyWith().apply(
              bodyColor: colorScheme.secondary,
              displayColor: colorScheme.secondary,
              decorationColor: colorScheme.secondary,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor: MaterialStateProperty.all(colorScheme.primary),
          ),
        ),
        iconTheme: IconThemeData(color: colorScheme.secondary),
        sliderTheme: SliderThemeData(
          activeTickMarkColor: colorScheme.secondary,
          inactiveTrackColor: colorScheme.primary,
          activeTrackColor: colorScheme.secondary,
          thumbColor: colorScheme.secondary,
          disabledActiveTickMarkColor: colorScheme.secondary,
          disabledActiveTrackColor: colorScheme.secondary,
          // inactiveTickMarkColor:
        ),
      ),
    );
  }
}
