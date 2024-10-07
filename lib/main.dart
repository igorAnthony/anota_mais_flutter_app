import 'package:flutter/material.dart';
import 'package:anotacoes_flutter_app/const/colors.dart';
import 'package:anotacoes_flutter_app/const/themes.dart';
import 'package:anotacoes_flutter_app/features/home/home.dart';
import 'package:anotacoes_flutter_app/features/login/presentation/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
      title: 'Login e Anotações',
      theme: _buildThemeData(),
      darkTheme: ThemeData.dark(),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    )
  );
}

ThemeData _buildThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.teal,
    ).copyWith(
      secondary: Colors.grey[800],
    ),
    textTheme: AppThemes.textTheme1,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}



