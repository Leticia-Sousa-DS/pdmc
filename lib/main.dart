import 'package:flutter/material.dart';
import 'package:nossa_lista_de_desenhos/data/cartoon_inherited.dart';
//import 'screens/form_screen.dart';
import 'screens/initial_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Cartoon List',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CartoonInherited(child: const InitialScreen()),
    );
  }
}








