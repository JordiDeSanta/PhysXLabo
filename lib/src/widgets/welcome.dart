import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final h = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorScheme.primary,
      ),
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
                    ),
                  ),
                  Text(
                    'Jordi Silva',
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w600,
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
          ),
        ),
      ),
    );
  }
}
