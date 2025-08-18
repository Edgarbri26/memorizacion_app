import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/my_colors.dart';
import 'package:memorizacion_app/design/spacing.dart';
import 'package:memorizacion_app/services/database_services.dart';
import 'package:memorizacion_app/widgets/app_bar_timer.dart';
import 'package:memorizacion_app/widgets/nav_bar.dart';

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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  '[Pulse para ver los pares]',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              // Puntuación
              const Text(
                '5/5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 72.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '10.23',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              const Spacer(),
              // Estadísticas
              const Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Media: 3.5', style: TextStyle(color: Colors.white)),
                    Text(
                      'Mejor: 3/4 7.5s',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('cuenta: 10', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              // Barra de navegación inferior
              NavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
