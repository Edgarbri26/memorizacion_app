import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/themes.dart';
import 'package:memorizacion_app/pages/home_page.dart';

class MemoApp extends StatelessWidget {
  const MemoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memorizacion Demo',
      theme: Themes.defaultTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

