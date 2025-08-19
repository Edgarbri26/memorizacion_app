import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/my_colors.dart';
import 'package:memorizacion_app/services/database_services.dart';
import 'package:memorizacion_app/widgets/app_bar_timer.dart';
import 'package:memorizacion_app/widgets/bodyhome.dart';
import 'package:memorizacion_app/widgets/nav_bar.dart';
import 'package:memorizacion_app/widgets/pair_container.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final DatabaseServices _databaseServices = DatabaseServices.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark, // Fondo oscuro
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const AppBarTimer(),
              // Pares
              PairContainer(
                generatedPairs:
                    "df sd sd as we sd we we we we sd sd ds dh sd sd sd sd",
                writtenPairs:
                    "jf sd sd as we sd cx er gr sd sd ds dh sd sd sd sd",
              ),
              // Puntuación
              Bodyhome(),
              // Barra de navegación inferior
              NavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
