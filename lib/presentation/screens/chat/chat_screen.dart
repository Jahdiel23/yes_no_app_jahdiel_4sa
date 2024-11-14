// presentation/screens/chat_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_jahdiel_4sa/domain/entities/message.dart';
import 'package:yes_no_app_jahdiel_4sa/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_jahdiel_4sa/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_jahdiel_4sa/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_jahdiel_4sa/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.usatoday.com/gcdn/-mm-/d2d1cefc220db7c5b88e785e152fb4c15c6aa5c8/c=24-15-1414-1869/local/-/media/2018/06/07/USATODAY/USATODAY/636639675072359238-Witherspoon-1.JPG?width=458&height=610&fit=crop&format=pjpg&auto=webp'),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Mi amor ❤️'),
            Text(
              'en línea',
              style: TextStyle(fontSize: 12, color: Colors.green),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            MessageFileBox(
              onValeu: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
