import 'package:dio/dio.dart';
import 'package:yesno_app/domain/entities/message.dart';
import 'package:yesno_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
//Instancia de la clase Dio para manejar las peticiones HTTP
  final _dio = Dio();

  Future<Message> getAnswer() async {
    // Almacenar el resultado de la peticion
    final response = await _dio.get('https://yesno.wtf/api');

    //Almacenar la data de la respuesta
    final yesNoModel = YesNoModel.fromJson(response.data);

    //Retornar la instancia de Message
    return yesNoModel.toMessageEntity();

    //Generar un error por si falla el servidor
    //throw UnimplementedError();
  }
}
