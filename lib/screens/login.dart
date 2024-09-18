import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/app-routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  void _togglePasswordView() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _registerUser(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.REGISTER);
  }

  void _logon(BuildContext context) async {
    if (txtEmail.text.isEmpty || txtPassword.text.isEmpty) {
      var snackBar = SnackBar(
        content: Text('Por favor, preencha os campos para fazer o login!'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: txtEmail.text,
        password: txtPassword.text,
      );
      Navigator.of(context).pushReplacementNamed(AppRoutes.CHAT);
    } on FirebaseAuthException catch (ex) {
      var snackBar = SnackBar(
        content: Text('Email ou senha incorreto!'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chat APP'),
      ),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset(
                    'assets/img/target-2070972_640.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: txtEmail,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: txtPassword,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordView,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () => _logon(context),
                    child: Text('Login'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextButton(
                    onPressed: () => _registerUser(context),
                    child: Text('Novo usuário'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
