import 'package:flutter/material.dart';
import 'package:to_no_lote/views/vwAutenticacao.dart';

void main() {
  runApp(MaterialApp(
    home: vwAutenticacao(),

    theme: ThemeData(
      useMaterial3: true,
      primaryColor: Color(0xFF01AC68),
      buttonColor: Color(0xFF01813C),
      primarySwatch: Colors.grey,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFF01813C)
          )
      ),

    ),
  ));
}
