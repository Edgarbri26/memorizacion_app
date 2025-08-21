import 'package:flutter/material.dart';
import 'package:memorizacion_app/config/app_routes.dart';
import 'package:memorizacion_app/design/themes.dart';
import 'package:memorizacion_app/widgets/home_page.dart';
import 'package:memorizacion_app/pages/configuration.dart';

class MemoApp extends StatelessWidget {
  const MemoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memorizacion Demo',
      theme: Themes.defaultTheme,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.configuration:
            return MaterialPageRoute(
              builder: (context) => const ConfigurationPages(title: 'Configuración'),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const MyHomePage(title: 'Memorizacion Home'),
            );
        }
      },
    );
  }
}
