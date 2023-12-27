import 'package:flutter/material.dart';
import 'package:login_e_anotacoes/const/colors.dart';
import 'package:login_e_anotacoes/const/dimensions.dart';

class AppWidgets {
  static Padding titleText(String text, {Color? color, String fontFamily = "Exo2", FontWeight fontWeight = FontWeight.w300}) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.textPaddingVertical),
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Colors.white,
          fontSize: Dimensions.pageTitleFontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  static Widget bodyText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: Dimensions.bodyTextFontSize,
        fontFamily: "Exo2",
        fontWeight: FontWeight.w300,
      ),
    );
  }

  static Widget inputField(String label, IconData prefixIcon, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.textFieldBorderRadius),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          errorStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "Exo",
            fontWeight: FontWeight.w300,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.textFieldBorderRadius),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimensions.textFieldPaddingHorizontal,
          ),
          prefixIcon: Icon(prefixIcon, color: AppColors.darkBlueColor, size: Dimensions.iconSize),
        ),
        obscureText: isPassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '* Campo obrigatório';
          }
          if (value.length > 20) {
            return '* Campo deve ter no máximo 20 caracteres';
          }
          if (value.endsWith(' ')) {
            return '* Campo não pode terminar com espaço';
          }
          if (isPassword) {
            if (value.length < 2) {
              return '* Campo deve ter no mínimo 2 caracteres';
            }
            // Não é permitido caracteres especiais, apenas letras e números
            if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
              return '* Campo não pode ter caracteres especiais';
            }
          }
          return null;
        },
        style: const TextStyle(
          color: Colors.black, 
          fontSize: 16, 
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  static LinearGradient gradientBackground({List<Color>? colors}) {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: colors ?? [AppColors.darkGreenColor, AppColors.darkGreenColor3]
    );
  }
}
