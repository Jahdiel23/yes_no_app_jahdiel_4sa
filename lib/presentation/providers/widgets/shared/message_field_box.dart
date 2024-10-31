import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();
    // ignore: non_constant_identifier_names
    final OutlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40));

      final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder:OutlineInputBorder,
        focusedBorder: OutlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print('button: $textValue');
            textController.clear();
          }
        ),
      );
    
    return TextFormField(
      onTapOutside:(event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}