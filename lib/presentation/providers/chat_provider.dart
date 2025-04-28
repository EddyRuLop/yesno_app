import 'package:flutter/material.dart';
import 'package:yesno_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
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
    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
    );
    //Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);

    //Notifica a provider que algo cambio
    notifyListeners();
  }
}
