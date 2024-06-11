import 'package:chatflutter/common/chat_app_bar.dart';
import 'package:chatflutter/main.dart';
import 'package:chatflutter/pages/chat/chat_page.dart';
import 'package:chatflutter/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class ChannelsPage extends StatefulWidget {
  const ChannelsPage({super.key});

  @override
  State<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends State<ChannelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: ListView(
        children: [
          createTile("chat-geral"),
          createTile("Canal tech"),
        ],
      ),
    );
  }

  Widget createTile(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          getit.get<ChatRepository>().setChannel(title);
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const ChatPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          textStyle: const TextStyle(color: Colors.white),
          shape: const BeveledRectangleBorder(),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
