import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yesno_app/domain/entities/message.dart";
import "package:yesno_app/presentation/providers/chat_provider.dart";
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
    //Le pide que este pendiente de cambios
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    //Enlaza el controlador creado en ChatProvider
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      //Instancia que sabra de quien es el mensaje
                      final message = chatProvider.messageList[index];

                      //Si el residuo es 0, es de ella , si no es 0 es mio.
                      //Más facil, si es par es de ella, si no, es mío.

                      //return (index % 2 == 0)
                      return (message.fromWho == FromWho.her)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),

            //Caja de texto
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
