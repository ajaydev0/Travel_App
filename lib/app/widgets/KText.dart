

import 'package:flutter/material.dart';

Widget Ktext(
    {required text,
    color,
    double? fontSize,
    fontWeight,
    textAlign,
    backgroundColor,
    wordSpacing,
    overflow,
    maxLines
    
    }) {
  return Text(text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: "Aleo",
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          backgroundColor: backgroundColor,
          wordSpacing: wordSpacing,
          overflow: overflow,
          
          ),maxLines: maxLines,);
}
