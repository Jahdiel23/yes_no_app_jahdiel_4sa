import 'package:dio/dio.dart';
import 'package:yes_no_app_jahdiel_4sa/domain/entities/message.dart';

class GetYesNoAnswer {
  // Se crea objeto de la clase Dio para manejar las peticiones HTTP
  final _dio = Dio();

  // Obtener la respuesta
  Future<Message> getAnswer() async {
    try {
      // Almacenar la petición GET en una variable
      final response = await _dio.get('https://yesno.wtf/api');

      // Verificar si la respuesta es exitosa
      if (response.statusCode == 200) {
        // Extraer el mensaje de la respuesta
        String answer = response.data['answer'];
        
        // Crear un nuevo mensaje basado en la respuesta
        return Message(text: answer, fromWho: FromWho.him); // Asegúrate de que 'her' esté definido en tu enumeración FromWho
      } else {
        // Manejo de errores si el estado no es 200
        return Message(text: 'Error al obtener respuesta', fromWho: FromWho.him);
      }
    } catch (e) {
      // Manejo de excepciones
      return Message(text: 'Error: $e', fromWho: FromWho.him);
    }
  }
}
