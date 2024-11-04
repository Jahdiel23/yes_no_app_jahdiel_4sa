import 'package:flutter/material.dart';
import 'package:yes_no_app_jahdiel_4sa/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message; // Asegúrate de tener la propiedad message

  const MyMessageBubble({super.key, required this.message}); // Recibe el mensaje

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
            padding: const EdgeInsets.all(5), // Ajusta el padding a 5 píxeles
            child: Text(
              message.text, // Usa el texto del mensaje
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}