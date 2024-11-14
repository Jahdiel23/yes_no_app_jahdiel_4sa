// domain/entities/message.dart

import 'package:intl/intl.dart';  // Importar para formatear la fecha

enum FromWho { me, hers, mine }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timestamp;
  final bool isRead;  // Nueva propiedad para saber si el mensaje ha sido leído

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    required this.timestamp,
    this.isRead = false,  // Inicializa como no leído por defecto
  });

  // Método para obtener la hora formateada
  String getFormattedTime() {
    return DateFormat('hh:mm a').format(timestamp);  // Formato de hora 12 horas
  }
}
