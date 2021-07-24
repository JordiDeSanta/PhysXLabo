import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:physxlab/src/utils/custom_colors.dart';

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
    final textTheme = Theme.of(context).primaryTextTheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: customColors.buttonsColor,
        ),
        height: h * 0.2,
        width: double.infinity,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome!',
                      style: textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w200,
                        color: customColors.iconsColor,
                      ),
                    ),
                    Text(
                      'Jordi Silva',
                      style: textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: customColors.iconsColor,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                CircleAvatar(
                  radius: 30,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image(
                      image: AssetImage('assets/img/jordidev.jpg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: customColors.buttonsColor,
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        selectedItemColor: customColors.selectedColor,
        dotIndicatorColor: customColors.selectedColor,
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
}

enum _SelectedTab { home, favorite, search, person }
