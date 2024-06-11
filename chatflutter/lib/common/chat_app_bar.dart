import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Center(
          child: Text(
        "Chat",
        style: TextStyle(color: Colors.white),
      )),
    );
    }

    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
}