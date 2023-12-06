import 'package:flutter/material.dart';
import 'package:nossa_lista_de_desenhos/data/cartoon_inherited.dart';
import 'package:nossa_lista_de_desenhos/screens/signup_screen.dart';
import 'data/database.dart';
import 'screens/initial_screen.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cartoonDatabase = await getDatabase();
  final userDatabase = await getUserDatabase();

  runApp(MyApp(
    cartoonDatabase: cartoonDatabase,
    userDatabase: userDatabase,
  ));
}

class MyApp extends StatelessWidget {
  final Database cartoonDatabase;
  final Database userDatabase;

  const MyApp({
    Key? key,
    required this.cartoonDatabase,
    required this.userDatabase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Cartoon List',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => CartoonInherited(
          child: LoginScreen(),
        ),
        '/initial': (context) => CartoonInherited(
          child: InitialScreen(
            cartoonDatabase: cartoonDatabase,
            userDatabase: userDatabase,
          ),
        ),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}
