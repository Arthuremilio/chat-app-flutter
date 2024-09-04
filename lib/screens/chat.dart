import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/app-routes.dart';

class chatScreen extends StatelessWidget {
  const chatScreen({super.key});

  void _logout(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
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
      body: Column(
        children: [
          Flexible(
              child: Container(
            child: ListView(
              reverse: true,
              children: [
                ListTile(
                  title: Text('Nome do usuário'),
                  subtitle: Text('Oi, tudo bem?'),
                  leading: CircleAvatar(
                    child: Text('A'),
                  ),
                ),
                ListTile(
                  title: Text('Nome do usuário'),
                  subtitle: Text('Oi, tudo bem?'),
                  leading: CircleAvatar(
                    child: Text('A'),
                  ),
                ),
              ],
            ),
          )),
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Digite sua mensagem',
                    labelText: 'Digite sua mensagem',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  size: 35,
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
