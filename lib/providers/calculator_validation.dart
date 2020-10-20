import 'package:flutter/material.dart';
import 'package:kalkulator_paliwa/providers/validation_item.dart';
import 'package:easy_localization/easy_localization.dart';

class CalculatorValidation extends ChangeNotifier {
  ValidationItem _kilometers = ValidationItem(null, null);
  ValidationItem _liter = ValidationItem(null, null);
  ValidationItem _fuelPrice = ValidationItem(null, null);
  ValidationItem _peopleQuantity = ValidationItem(null, null);
  String _result = '???';

  ValidationItem get kilometers => _kilometers;
  ValidationItem get liter => _liter;
  ValidationItem get fuelPrice => _fuelPrice;
  ValidationItem get peopleQuantity => _peopleQuantity;
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
    } else {
      _kilometers = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void setLiter(String value) {
    if (value.isEmpty) {
      _liter = ValidationItem(null, 'cannot-be-blank'.tr());
    } else {
      _liter = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void setFuelPrice(String value) {
    if (value.isEmpty) {
      _fuelPrice = ValidationItem(null, 'cannot-be-blank'.tr());
    } else {
      _fuelPrice = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void setPeopleQuantity(String value) {
    if (value.isNotEmpty) {
      _peopleQuantity = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void calculate() {
    _kilometers.value = _kilometers.value.replaceAll(',', '.');
    _liter.value = _liter.value.replaceAll(',', '.');
    _fuelPrice.value = _fuelPrice.value.replaceAll(',', '.');

    if (_peopleQuantity.value != null) {
      double _calculatedPrice =
          (((double.parse(_kilometers.value) * double.parse(_liter.value)) /
                      100) *
                  double.parse(_fuelPrice.value)) /
              double.parse(_peopleQuantity.value);

      _result = _calculatedPrice.toStringAsFixed(2).replaceAll('.', ',');
    } else {
      double _calculatedPrice =
          ((double.parse(_kilometers.value) * double.parse(_liter.value)) /
                  100) *
              double.parse(_fuelPrice.value);

      _result = _calculatedPrice.toStringAsFixed(2);
    }
    print(_peopleQuantity.value);

    notifyListeners();
  }
}
