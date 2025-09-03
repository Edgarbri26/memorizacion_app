import 'package:flutter/material.dart';
import 'package:memorizacion_app/config/app_routes.dart';
import 'package:memorizacion_app/design/themes.dart';
import 'package:memorizacion_app/pages/home_page.dart';
import 'package:memorizacion_app/pages/settings_page.dart';

class MemoApp extends StatefulWidget {
  const MemoApp({super.key});

  @override
  MemoAppState createState() => MemoAppState();
}

class MemoAppState extends State<MemoApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memorizacion Demo',
      theme: Themes.defaultTheme,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.settings:
            return MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            );
          default:
            return MaterialPageRoute(builder: (context) => const MyHomePage());
        }
      },
    );
  }
}
