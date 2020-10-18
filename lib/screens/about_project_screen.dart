import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kalkulator_paliwa/shared/text_styles.dart';

class AboutProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyles textStyles = TextStyles();
    return Scaffold(
      appBar: AppBar(
        title: Text('about-project').tr(),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                  'lib/assets/images/kalkulator_paliwa_light_icon.png',
                  height: 100.0),
            ),
            SizedBox(height: 10.0),
            Text('about-project-description',
                    style: textStyles.aboutProjectDescription)
                .tr(),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('made-with-love').tr(),
            )
          ],
        ),
      ),
    );
  }
}
