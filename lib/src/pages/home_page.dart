import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:physxlab/src/utils/custom_colors.dart';
import 'package:physxlab/src/widgets/welcome.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedTab = _SelectedTab.home;
  final customColors = CustomColors();

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: customColors.backgroundColor,
        systemNavigationBarDividerColor: customColors.backgroundColor,
      ),
    );

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).primaryTextTheme;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Welcome(),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      _createButton(
                          w, h, FontAwesomeIcons.satelliteDish, 'Waves'),
                      _createButton(
                          w, h, FontAwesomeIcons.appleAlt, 'Mechanics'),
                    ],
                  ),
                  TableRow(
                    children: [
                      _createButton(w, h, FontAwesomeIcons.burn, 'Energy'),
                      _createButton(w, h, FontAwesomeIcons.plug, 'Electricity'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: customColors.buttonsColor,
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        selectedItemColor: customColors.darkColor,
        dotIndicatorColor: customColors.darkColor,
        unselectedItemColor: customColors.iconsColor,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.favorite_border),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.science),
          ),
        ],
      ),
    );
  }

  Widget _createButton(double w, double h, IconData icon, String name) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          height: h * 0.3,
          child: Icon(
            icon,
            size: 60,
            color: customColors.iconsColor,
          ),
        ),
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
