import 'package:flutter/material.dart';
import 'package:yes_no_app_jahdiel_4sa/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        // Agregar la hora de envío debajo del mensaje
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 5),
          child: Text(
            message.getFormattedTime(), // Muestra la hora usando el método del modelo
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey, // Estilo para la hora
            ),
          ),
        ),
        // Agregar las palomitas azules con los cambios solicitados
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Ajusta el tamaño del Row al contenido
            children: [
              const Icon(
                Icons.done_all, // Siempre mostrar el ícono de done_all
                size: 14, // Tamaño 14
                color: Colors.blue, // Color azul
              ),
              const SizedBox(width: 5), // Añadir espacio entre el ícono y el texto
              Text(
                message.isRead ? 'Leído' : 'Leído', // Mostrar el estado del mensaje
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey, // Estilo para el texto
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

