import 'package:flutter/material.dart';
import 'home.dart';
import 'resultado.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/home': (context) => HomePage(),
      '/resultado': (context) => ResultadoPage(),
    },
  ));
}
