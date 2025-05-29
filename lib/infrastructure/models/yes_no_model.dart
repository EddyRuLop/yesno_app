import 'dart:math';
import 'package:yesno_app/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMessageEntity() {
    final random = Random();
    final answerLower = answer.toLowerCase();

    final text = answerLower == 'yes'
        ? [
            'Sí',
            'Claro',
            'Afirmativo',
            'Simón',
            'Por supuesto'
          ][random.nextInt(5)]
        : answerLower == 'no'
            ? [
                'No',
                'Nel',
                'Negativo',
                'Para nada',
                'Ni loco'
              ][random.nextInt(5)]
            : [
                'Puede ser',
                'Tal vez',
                'Quizás',
                'No estoy seguro',
                'Probablemente'
              ][random.nextInt(5)];

    return Message(
      text: text,
      fromWho: FromWho.her,
      imageUrl: image,
    );
  }
}
