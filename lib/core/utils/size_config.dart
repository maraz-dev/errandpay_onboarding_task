import 'package:flutter/material.dart';

/// Initializing the Class and getting the width and height
/*
    SizeConfig().init(context);
    double? height = SizeConfig.screenHeight;
    double? width = SizeConfig.screenWidth;
    print('The width is $width and the height is $height');
*/


class SizeConfig {

  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  static Brightness? brightnessValue;

  static bool? isDarkMode;

  static bool? systemMode;
  static bool? isDarkModeNotSystem;
  static bool? isDarkModeSystem;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    brightnessValue = _mediaQueryData!.platformBrightness;
    /* isDarkMode = systemMode! ? brightnessValue == Brightness.dark : isDarkMode; */
    isDarkModeSystem = brightnessValue == Brightness.dark;
    isDarkModeNotSystem = isDarkModeNotSystem;

    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = (screenWidth! / 100);
    blockSizeVertical = (screenHeight! / 100);

    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenWidth! - _safeAreaVertical!) / 100;
  }
}
