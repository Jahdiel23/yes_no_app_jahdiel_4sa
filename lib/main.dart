import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_jahdiel_4sa/config/theme/app_theme.dart';
import 'package:yes_no_app_jahdiel_4sa/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_jahdiel_4sa/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //es un build context y lo que hace es los cambios en el Chat provider
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Yes_No_App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}