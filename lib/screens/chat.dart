import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/app-routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class chatScreen extends StatelessWidget {
  var txtMessage = TextEditingController();
  var user = (FirebaseAuth.instance).currentUser;

  void _logout(BuildContext context) async {
    Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
  }

  void sendMessage() {
    if (user == null) {
      // Exibir um alerta ou mensagem indicando que o usuário precisa fazer login

      return;
    }
    var data = {
      "user_id": user!.uid,
      "name": user!.displayName ??
          'Desconhecido', // Valor padrão se displayName for null
      "message": txtMessage.text,
      "date": DateTime.now(),
    };

    FirebaseFirestore.instance.collection('messages').add(data);

    txtMessage.clear();
  }

  void translateMessage(String docId, String text) async {
    const apiKey = 'AIzaSyDId0AqrYpHBO3OffEPkZnajZQRvz3S-z4';

    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );

    final prompt =
        'Traduza para inglês o text "$text", Retorne apenas o texto traduzido.';
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);

    FirebaseFirestore.instance
        .collection('messages')
        .doc(docId)
        .update({"message": response.text});
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
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('messages')
                    .snapshots(),
                builder: (ctx, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (ctx, index) {
                      final message = docs[index].data();
                      final messageText =
                          message['message'] ?? 'Mensagem vazia';

                      return ListTile(
                        onTap: () => translateMessage(
                            docs[index].id, message['message']),
                        key: Key(docs[index].id),
                        leading: CircleAvatar(
                          child: Text('A'),
                        ),
                        title: Text(message['name'] ?? 'Fulano'),
                        subtitle: Text(messageText),
                      );
                    },
                    reverse: true,
                  );
                }),
          ),
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: txtMessage,
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
                onPressed: sendMessage,
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
