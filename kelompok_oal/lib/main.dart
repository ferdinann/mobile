import 'package:flutter/material.dart';
import 'package:kelompok_oal/Activity/login.dart';
import 'package:kelompok_oal/provider/QuizProvider.dart';
import 'package:kelompok_oal/provider/Quizchek.dart';
import 'package:kelompok_oal/provider/Switch.dart';
import 'package:kelompok_oal/provider/bottonN.dart';
import 'package:kelompok_oal/provider/learning_provider.dart';
import 'package:kelompok_oal/provider/loading_provider.dart';
import 'package:kelompok_oal/provider/notifProvider.dart';
import 'package:kelompok_oal/provider/obscure.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Obscure()),
      ChangeNotifierProvider(create: (_) => QuizProvider()),
      ChangeNotifierProvider(create: (_) => serchClick()),
      ChangeNotifierProvider(create: (_) => Quizchek()),
      ChangeNotifierProvider(create: (_) => BottonNavigation()),
      ChangeNotifierProvider(create: (_) => Mode()),
      ChangeNotifierProvider(create: (_) => notifProvider()),
      ChangeNotifierProvider(create: (_) => LoadingProvider()),
      ChangeNotifierProvider(create: (_) => LearningProvider())
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var DarkMode = Provider.of<Mode>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: DarkMode.enableDarkMode ? DarkMode.dark : DarkMode.light,
      home: const MyLogin(),
    );
  }
}
