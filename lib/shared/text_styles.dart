import 'package:flutter/material.dart';

class TextStyles {
  TextStyle get heading1 => _heading1();

  TextStyle get aboutProjectDescription => _aboutProjectDescription();

  TextStyle _heading1() => TextStyle(color: Colors.white, fontSize: 24.0);

  TextStyle _aboutProjectDescription() => TextStyle(fontSize: 20.0);
}
