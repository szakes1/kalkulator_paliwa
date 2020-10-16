import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kalkulator_paliwa/shared/text_styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyles _textStyles = TextStyles();

    return Scaffold(
      appBar: AppBar(
        title: Text('title').tr(),
        centerTitle: false,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            DrawerHeader(
              child: Text('title', style: _textStyles.heading1).tr(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.5, 0.0),
                  colors: [
                    Colors.red[900],
                    Colors.red[400],
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('about-project').tr(),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
