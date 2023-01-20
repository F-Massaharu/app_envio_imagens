import 'package:app_envio_imagens/images/image_selector.dart';
import 'package:app_envio_imagens/login/login_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Home Page", textAlign: TextAlign.center),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImageSelectorPage(),
                ),
              );
            },
            child: const Text("Inserir Imagens"),
          ),
          TextButton(
            onPressed: () {
              sair();
            },
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }

  sair() async {
    await _firebaseAuth.signOut().then(
          (user) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckLoginPage(),
            ),
          ),
        );
  }
}
