import 'package:flutter/material.dart';
import 'package:yes_no_app_jahdiel_4sa/presentation/providers/widgets/shared/him_message_bubble.dart';
import 'package:yes_no_app_jahdiel_4sa/presentation/providers/widgets/shared/message_field_box.dart';
import 'package:yes_no_app_jahdiel_4sa/presentation/providers/widgets/shared/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding:  EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://pbs.twimg.com/media/EheVW_8WAAE-9mJ.jpg'),
          ),
        ),
        title: const Text('Mi amor'),
        centerTitle: false,
      ),
      body: _Chatview(),
    );
  }
}

class _Chatview extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10 ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index){
                return (index % 2 == 0)
                ? const HimMessageBubble()
                :const MyMessageBubble();
                })),

                /// Caja de texto de mensajes
                const MessageFieldBox(),
          ]
        ),
      ),
    );
  }
}