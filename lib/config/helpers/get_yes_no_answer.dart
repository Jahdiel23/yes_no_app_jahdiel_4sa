import 'package:dio/dio.dart';
import 'package:yes_no_app_jahdiel_4sa/domain/entities/message.dart';
import 'package:yes_no_app_jahdiel_4sa/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    //Almacenar la funcion tipo get en una variable
    final response = await _dio.get('https://yesno.wtf/api');
    //Almacenar la data de la respuesta de  una variable
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //Devolver la instancia de "Message" creada en el madelo
    return yesNoModel.toMessageEntitie();

    //Generar el error
    //throw UnimplementedError();
  }
}
