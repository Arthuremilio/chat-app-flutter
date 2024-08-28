import 'package:flutter/material.dart';
import '../utils/app-routes.dart';

class chatScreen extends StatelessWidget {
  const chatScreen({super.key});

  void _logout(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.LOGIN,
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chat'),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
