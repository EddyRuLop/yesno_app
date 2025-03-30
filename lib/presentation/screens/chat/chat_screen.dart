import "package:flutter/material.dart";
import "package:yesno_app/presentation/widgets/chat/her_message_bubble.dart";
import "package:yesno_app/presentation/widgets/chat/my_message_bubble.dart";
import "package:yesno_app/presentation/widgets/shared/message_field_box.dart";

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
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return (index % 2 == 0)
                          ? const HerMessageBubble()
                          : const MyMessageBubble();
                    })),

            //Caja de texto
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
