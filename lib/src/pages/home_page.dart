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
  var _selectedTab = _SelectedTab.laboratory;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: colorScheme.background,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

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
            icon: Icon(Icons.science_outlined),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.favorite_border),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.mode_comment_outlined),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.person_outline),
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
        onPressed: () {
          Navigator.pushNamed(context, 'axis');
        },
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

enum _SelectedTab { laboratory, favorites, community, profile }
