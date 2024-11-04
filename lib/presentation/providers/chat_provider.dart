import 'package:flutter/material.dart';
import 'package:yes_no_app_jahdiel_4sa/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_jahdiel_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola lindo', fromWho: FromWho.me),
    Message(text: 'Te tengo que preguntar algo', fromWho: FromWho.me)
  ];

  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // Imprimir la cantidad de mensajes en la consola
    print('Cantidad de mensajes: ${messageList.length}');

    if (text.endsWith('?')) {
      await herReply(); // Asegúrate de esperar la respuesta
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    if (!chatScrollController.hasClients) return;

    await Future.delayed(const Duration(milliseconds: 300));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    chatScrollController.dispose();
    super.dispose();
  }
}