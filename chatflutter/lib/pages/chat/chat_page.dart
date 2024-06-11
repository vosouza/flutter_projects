import 'package:chatflutter/common/chat_app_bar.dart';
import 'package:chatflutter/main.dart';
import 'package:chatflutter/model/message.dart';
import 'package:chatflutter/repository/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var textMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: getit.get<ChatRepository>().getMessage(),
                builder:
                    (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.toString());
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print(snapshot.toString());
                    return const Text("Loading");
                  }
                  return ListView(
                    reverse: true,
                    children: snapshot.data!.docs
                        .map(
                          (DocumentSnapshot document) {
                            var msg = Message.fromJson(
                                document.data() as Map<String, dynamic>);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.elliptical(10, 10))),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      "${msg.nome} : ${msg.msg}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                        .toList()
                        .cast(),
                  );
                },
              ),
            ),
            const SizedBox(height: 32,),
            TextField(
              controller: textMessage,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    var msg = textMessage.text;
                    getit.get<ChatRepository>().sendMessage(msg);
                    textMessage.text = "";
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}