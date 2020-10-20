import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalkulator_paliwa/providers/calculator_validation.dart';
import 'package:kalkulator_paliwa/shared/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class CalculatorForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<CalculatorValidation>(context);
    final TextStyles textStyles = TextStyles();

    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'kilometers'.tr(),
            errorText: validationService.kilometers.error,
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
          ),
          onChanged: (String value) {
            validationService.setKilometers(value);
            validationService.calculate();
          },
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        SizedBox(height: 10.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'liter'.tr(),
            errorText: validationService.liter.error,
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
          ),
          onChanged: (String value) {
            validationService.setLiter(value);
            validationService.calculate();
          },
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        SizedBox(height: 10.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'fuel-price'.tr(),
            errorText: validationService.fuelPrice.error,
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
          ),
          onChanged: (String value) {
            validationService.setFuelPrice(value);
            validationService.calculate();
          },
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        SizedBox(height: 10.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'people-quantity'.tr(),
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
          ),
          onChanged: (String value) {
            validationService.setPeopleQuantity(value);
            validationService.calculate();
          },
          keyboardType: TextInputType.numberWithOptions(decimal: false),
        ),
        SizedBox(height: 30.0),
        Text('result', style: textStyles.result).tr(args: [
          validationService.result,
        ])
      ],
    );
  }
}
