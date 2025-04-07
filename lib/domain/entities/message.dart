enum FromWho { me, her }

//Identidad atómica: La unidad mas pequeña

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  //al final de la practica nos vana poner examen de que pongamos la hora del que se envio el mensaje
  //final

  Message({required this.text, this.imageUrl, required this.fromWho});
}
