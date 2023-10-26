
import 'package:flutter/material.dart';
import 'package:work/screens/add_screen.dart';
import 'package:work/screens/solar_system_screen.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => const MySolarSystem(),
        '/add': (context) => const AddScreen()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    ),
  );
}




