import 'package:flutter/material.dart';

//Open Sans Bold
TextStyle openSansBoldText({Color? color, double? fontSize}) {
  return TextStyle(
    fontFamily: 'OpenSans',
    color: color ?? Colors.black,
    fontSize: fontSize ?? 14,
    fontWeight: FontWeight.w700,
  );
}

//Open Sans ExtraBold
TextStyle openSansExtraBoldText({Color? color, double? fontSize}) {
  return TextStyle(
    fontFamily: 'OpenSans',
    color: color ?? Colors.black,
    fontSize: fontSize ?? 14,
    fontWeight: FontWeight.w900,
  );
}

//Open Sans Light
TextStyle openSansLight({Color? color, double? fontSize}) {
  return TextStyle(
    fontFamily: 'OpenSans',
    color: color ?? Colors.black,
    fontSize: fontSize ?? 14,
    fontWeight: FontWeight.w200,
  );
}

TextStyle openSansMedium({Color? color, double? fontSize}) {
  return TextStyle(
    fontFamily: 'OpenSans',
    color: color ?? Colors.black,
    fontSize: fontSize ?? 14,
    fontWeight: FontWeight.w500,
  );
}

TextStyle openSansRegular({Color? color, double? fontSize}) {
  return TextStyle(
    fontFamily: 'OpenSans',
    color: color ?? Colors.black,
    fontSize: fontSize ?? 14,
  );
}

TextStyle openSansSemiBold({Color? color, double? fontSize}) {
  return TextStyle(
    fontFamily: 'OpenSans',
    color: color ?? Colors.black,
    fontSize: fontSize ?? 14,
    fontWeight: FontWeight.w600,
  );
}
