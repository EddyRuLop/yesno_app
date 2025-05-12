import 'package:flutter/material.dart';
import 'package:yesno_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //Controlador que maneja la posicion del scroll
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: "Hola Salazar", fromWho: FromWho.me),
    Message(
        text: "Por haberte ido, te vas a especial directo",
        fromWho: FromWho.her),
    Message(
        text: "Por haberte ido, te vas a especial directo",
        fromWho: FromWho.her),
    Message(
        text: "Por haberte ido, te vas a especial directo",
        fromWho: FromWho.her),
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
    );

    //Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    debugPrint('flutter: Cantidad de mensajes: ${messageList.length}');

    //Notifica a provider que algo cambio
    notifyListeners();

    moveScrollToBottom();
  }

  //Mover el scroll hasta abajo
  Future<void> moveScrollToBottom() async {
    //Animacion
    await Future.delayed(const Duration(milliseconds: 300));
    chatScrollController.animateTo(
      //offset: posicion del máximo scroll posible
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      //rebote al final de la animación
      curve: Curves.easeOut,
    );
  }
}
