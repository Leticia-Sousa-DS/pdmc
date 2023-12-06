import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  void _recoverPassword(BuildContext context) async {
    String email = emailController.text;

    // Simular um processo assíncrono de envio de e-mail
    bool emailSent = await _sendRecoveryEmail(email);

    if (emailSent) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Um e-mail de recuperação foi enviado para $email'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao enviar o e-mail de recuperação'),
        ),
      );
    }
  }

  Future<bool> _sendRecoveryEmail(String email) async {
    // Lógica de envio de e-mail de recuperação vai estar aqui
    // Este é apenas um exemplo simulado, necessário substituir com a implementação real
    await Future.delayed(Duration(seconds: 2)); // Simula um processo assíncrono

    // Simulando que o e-mail foi enviado com sucesso
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueci a Senha'),
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
              Text(
                'Digite seu e-mail para recuperar a senha:',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _recoverPassword(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: Text(
                  'Recuperar Senha',
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
