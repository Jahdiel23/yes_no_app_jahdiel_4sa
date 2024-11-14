// presentation/providers/chat_provider.dart

import 'package:flutter/material.dart';
import 'package:yes_no_app_jahdiel_4sa/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_jahdiel_4sa/domain/entities/message.dart';
import 'package:yes_no_app_jahdiel_4sa/presentation/widgets/chat/her_message_bubble.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> _messageList = [];
  final ScrollController chatScrollController = ScrollController();

  List<Message> get messageList => _messageList;

  void sendMessage(String text) {
    if (text.isEmpty) return;

    final newMessage = Message(
      text: text,
      fromWho: FromWho.mine, 
      timestamp: DateTime.now(),  // Asignamos el timestamp actual
    );

    _messageList.add(newMessage);
    if (text.endsWith('?')){
      herReply();
    }
    notifyListeners();
    
    // Llamada a moveScrollToBottom después de agregar el mensaje
    moveScrollToBottom();
  }

  // Método simplificado para mover el scroll hasta el final
  void moveScrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  // Método de limpieza del controlador al destruir el provider
  @override
  void dispose() {
    chatScrollController.dispose();
    super.dispose();
  }

  GetYesNoAnswer answer = GetYesNoAnswer();
  Future<void> herReply() async {
    final herMessage = await answer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }
  }
  


