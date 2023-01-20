import 'package:app_envio_imagens/login/login_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextFormField(
            controller: _nomeController,
            decoration: const InputDecoration(label: Text("Nome Completo")),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(label: Text("Email de Acesso")),
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(label: Text("Senha de Acesso")),
          ),
          ElevatedButton(
            onPressed: () {
              cadastrar();
            },
            child: const Text("Cadastrar"),
          ),
        ],
      ),
    );
  }

  cadastrar() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      if (userCredential != null) {
        userCredential.user!.updateDisplayName(_nomeController.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => CheckLoginPage(),
            ),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Este email já está em uso!"),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == "weak-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Utilize uma senha mais forte!"),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
