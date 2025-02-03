import 'package:erply_ui/erply_ui.dart';
import 'package:flutter/material.dart';

final exampleErplyTheme = ErplyThemeData(
  name: 'Example',
  lightColorConfig: ErplyColorConfig.defaultLight.copyWith(
    primary: Colors.green,
    secondary: Colors.red,
    background: Colors.white,
  ),
  darkColorConfig: ErplyColorConfig.defaultDark.copyWith(
    primary: Colors.green,
    secondary: Colors.red,
    background: Colors.black,
  ),
  typographyConfig: ErplyTypographyConfig(
    fontFamily: 'packages/erply_ui/SFProDisplay',
  ),
);

final appThemeData = ErplyThemeData(
  name: 'App Theme',
  lightColorConfig: ErplyColorConfig.defaultLight.copyWith(
    primary: Colors.green,
    secondary: Colors.red,
    background: Colors.white,
  ),
  darkColorConfig: ErplyColorConfig.defaultDark.copyWith(
    primary: Colors.green,
    secondary: Colors.red,
    background: Colors.black,
  ),
  typographyConfig: ErplyTypographyConfig.generate(
    fontFamily: 'Roboto',
  ),
);
