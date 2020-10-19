import 'package:flutter/material.dart';

class TextStyles {
  TextStyle get heading1 => _heading1();

  TextStyle get regular => _regular();

  TextStyle get drawerHeader => _drawerHeader();

  TextStyle get aboutProjectDescription => _aboutProjectDescription();

  TextStyle get result => _result();

  TextStyle _heading1() =>
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600);

  TextStyle _regular() => TextStyle(fontSize: 20.0);

  TextStyle _drawerHeader() => TextStyle(color: Colors.white, fontSize: 24.0);

  TextStyle _aboutProjectDescription() => TextStyle(fontSize: 20.0);

  TextStyle _result() => TextStyle(
      fontSize: 24.0, fontWeight: FontWeight.w900, color: Colors.red[700]);
}
