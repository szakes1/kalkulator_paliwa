import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kalkulator_paliwa/providers/calculator_validation.dart';
import 'package:kalkulator_paliwa/screens/about_project_screen.dart';
import 'package:kalkulator_paliwa/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(EasyLocalization(
    supportedLocales: [Locale('pl', 'PL')],
    path: 'lib/assets/translations',
    fallbackLocale: Locale('pl', 'PL'),
    child: KalkulatorPaliwa(),
  ));
}

class KalkulatorPaliwa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorValidation(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'title'.tr(),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          routes: {
            '/about-project': (context) => AboutProjectScreen(),
          },
          theme: ThemeData(
            primaryColor: Colors.red[700],
            fontFamily: 'Comfortaa',
          ),
        ),
      ),
    );
  }
}
