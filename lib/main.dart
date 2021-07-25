import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        colorScheme: ColorScheme.dark().copyWith(
          primary: Color.fromARGB(255, 70, 41, 100),
          secondary: Color.fromARGB(255, 156, 84, 213),
          background: Color.fromARGB(255, 70, 41, 100),
        ),
        primaryTextTheme: GoogleFonts.openSansCondensedTextTheme(),
        primaryIconTheme: IconThemeData(color: customColors.iconsColor),
        iconTheme: IconThemeData(color: customColors.iconsColor),
        accentIconTheme: IconThemeData(color: customColors.iconsColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor:
                MaterialStateProperty.all(customColors.buttonsColor),
          ),
        ),
      ),
    );
  }
}
