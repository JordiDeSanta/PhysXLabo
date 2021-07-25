import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:physxlab/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.dark().copyWith(
      background: Color.fromARGB(255, 70, 41, 100),
      primary: Color.fromARGB(255, 156, 84, 213),
      secondary: Color.fromARGB(255, 94, 226, 240),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhysXLab',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
      },
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: colorScheme.background,
        appBarTheme: AppBarTheme(),
        colorScheme: colorScheme,
        textTheme: GoogleFonts.openSansCondensedTextTheme().copyWith().apply(
              bodyColor: Color.fromARGB(255, 94, 226, 240),
              displayColor: Color.fromARGB(255, 94, 226, 240),
              decorationColor: Color.fromARGB(255, 94, 226, 240),
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
      ),
    );
  }
}
