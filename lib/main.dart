import 'package:flutter/material.dart';
import 'package:nossa_lista_de_desenhos/screens/signup_screen.dart';
import 'screens/initial_screen.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password_screen.dart';

void main() {
  runApp(MyApp());
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/initial': (context) => const InitialScreen(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}
