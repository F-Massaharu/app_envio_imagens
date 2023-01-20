import 'dart:async';

import 'package:app_envio_imagens/home/home_page.dart';
import 'package:app_envio_imagens/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckLoginPage extends StatefulWidget {
  const CheckLoginPage({Key? key}) : super(key: key);

  @override
  State<CheckLoginPage> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLoginPage> {
  StreamSubscription? streamSubscription;

  @override
  initState() {
    super.initState();
    streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
