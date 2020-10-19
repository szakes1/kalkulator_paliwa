import 'package:flutter/material.dart';
import 'package:kalkulator_paliwa/providers/validation_item.dart';
import 'package:easy_localization/easy_localization.dart';

class CalculatorValidation extends ChangeNotifier {
  ValidationItem _kilometers = ValidationItem(null, null);
  ValidationItem _liter = ValidationItem(null, null);
  ValidationItem _fuelPrice = ValidationItem(null, null);
  String _result = '???';

  ValidationItem get kilometers => _kilometers;
  ValidationItem get liter => _liter;
  ValidationItem get fuelPrice => _fuelPrice;
  String get result => _result;

  bool get isValid {
    if (kilometers != null && liter.value != null && fuelPrice.value != null) {
      return false;
    } else {
      return true;
    }
  }

  void setKilometers(String value) {
    if (value.isEmpty) {
      _kilometers = ValidationItem(
        null,
        'cannot-be-blank'.tr(),
      );
    } else if (value.contains(',')) {
      _kilometers = ValidationItem(null, 'cannot-contain-comma'.tr());
    } else {
      _kilometers = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void setLiter(String value) {
    if (value.isEmpty) {
      _liter = ValidationItem(null, 'cannot-be-blank'.tr());
    } else if (value.contains(',')) {
      _liter = ValidationItem(null, 'cannot-contain-comma'.tr());
    } else {
      _liter = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void setFuelPrice(String value) {
    if (value.isEmpty) {
      _fuelPrice = ValidationItem(null, 'cannot-be-blank'.tr());
    } else if (value.contains(',')) {
      _fuelPrice = ValidationItem(null, 'cannot-contain-comma'.tr());
    } else {
      _fuelPrice = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void calculate() {
    double _calculatedPrice =
        ((double.parse(kilometers.value) * double.parse(liter.value)) / 100) *
            double.parse(fuelPrice.value);

    _result = _calculatedPrice.toStringAsFixed(2);
    notifyListeners();
  }
}