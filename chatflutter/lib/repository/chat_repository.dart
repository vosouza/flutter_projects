import 'package:chatflutter/model/channel.dart';
import 'package:chatflutter/model/message.dart';
import 'package:chatflutter/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  FirebaseFirestore db;
  Channel canal = Channel('chat-geral');
  User? user;

  ChatRepository(this.db);

  setUser(String name) {
    user = User(name);
  }

  setChannel(String chanelName) {
    canal = Channel(chanelName);
  }

  sendMessage(String msg) async {
    db = FirebaseFirestore.instance;
    var m = Message(hora: "hora", nome: user?.name ?? "", msg: msg).toJson();

    try {
      await db.collection(canal.chanelName).add(m).then(
            (DocumentReference doc) => print(
              'DocumentSnapshot added with ID: ${doc.id}',
            ),
          );
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Stream<QuerySnapshot> getMessage() {
    return FirebaseFirestore.instance.collection(canal.chanelName).snapshots();
  }
}
//Function(Message) callbakc