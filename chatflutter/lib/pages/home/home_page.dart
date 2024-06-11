import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatflutter/common/chat_app_bar.dart';
import 'package:chatflutter/main.dart';
import 'package:chatflutter/pages/channels/channels_page.dart';
import 'package:chatflutter/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agne',
                        color: Colors.black),
                    child: AnimatedTextKit(
                      pause: const Duration(milliseconds: 3000),
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        TypewriterAnimatedText('Bem vindo ao chat ;)',
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: textMessage,
              decoration: const InputDecoration(
                label: Text("Digite seu nick"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                var name = textMessage.text;
                getit.get<ChatRepository>().setUser(name);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ChannelsPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'ENTRAR NO CHAT',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
