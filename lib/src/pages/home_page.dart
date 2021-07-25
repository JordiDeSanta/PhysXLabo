import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:physxlab/src/widgets/welcome.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedTab = _SelectedTab.home;

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
      ),
    );

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).primaryTextTheme;
    final colorScheme = Theme.of(context).colorScheme;

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
                          context, h, FontAwesomeIcons.satelliteDish, 'Waves'),
                      _createButton(
                          context, h, FontAwesomeIcons.appleAlt, 'Mechanics'),
                    ],
                  ),
                  TableRow(
                    children: [
                      _createButton(
                          context, h, FontAwesomeIcons.burn, 'Energy'),
                      _createButton(
                          context, h, FontAwesomeIcons.plug, 'Electricity'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: colorScheme.primary,
        selectedItemColor: colorScheme.background,
        dotIndicatorColor: colorScheme.secondary,
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
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

  Widget _createButton(
      BuildContext context, double h, IconData icon, String name) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          height: h * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(height: h * 0.02),
              Text(
                name,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
