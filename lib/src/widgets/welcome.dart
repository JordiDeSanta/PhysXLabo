import 'package:flutter/material.dart';
import 'package:physxlab/src/utils/custom_colors.dart';

class Welcome extends StatelessWidget {
  final customColors = CustomColors();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;
    final h = MediaQuery.of(context).size.height;

    return Row(
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
        Container(
          height: h * 0.1,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Image(
            image: AssetImage('assets/img/jordidev.jpg'),
          ),
        ),
      ],
    );
  }
}
