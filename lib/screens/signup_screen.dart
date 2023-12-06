import 'package:flutter/material.dart';
import 'package:nossa_lista_de_desenhos/data/user_dao.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserDao userDao = UserDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.yellow],  // Cores do degradê
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo de Nome
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Nome',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person, color: Colors.redAccent),
                ),
              ),
              SizedBox(height: 16),
              // Campo de Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email, color: Colors.redAccent),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              // Campo de Senha
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock, color: Colors.redAccent),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              // Botão de Cadastro
              ElevatedButton(
                onPressed: () async {
                  // Lógica de cadastro aqui
                  Map<String, dynamic> user = userDao.toMap(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );

                  int result = await userDao.save(user);

                  if (result > 0) {
                    Navigator.pushReplacementNamed(context, '/login');
                  } else {
                    print('Erro ao cadastrar usuário');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
