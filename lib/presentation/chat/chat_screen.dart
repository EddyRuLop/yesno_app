import "package:flutter/material.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://files.idyllic.app/files/static/250420?width=256&optimizer=image"),
          ),
        ),
        title: const Text("Mi amor"),
        centerTitle: false,
      ),
    );
  }
}
