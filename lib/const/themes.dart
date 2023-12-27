import 'package:flutter/material.dart';
import 'package:login_e_anotacoes/const/dimensions.dart';

class AppThemes {
  static const textTheme1 = TextTheme(
    //font family = google font: exo2
     
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.w200,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: Dimensions.pageTitleFontSize,
      fontWeight: FontWeight.w300,
    ), 
  );
}