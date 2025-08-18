import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/my_colors.dart';
import 'package:memorizacion_app/design/spacing.dart';

class AppBarTimer extends StatefulWidget {
  const AppBarTimer({super.key});

  @override
  State<AppBarTimer> createState() => _AppBarTimerState();
}

class _AppBarTimerState extends State<AppBarTimer> {
  final dynamic counter = 5;
  final dynamic title = 'Clasico';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.darkContraste,
        borderRadius: BorderRadius.circular(Spacing.lg),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.lg,
        vertical: Spacing.xs,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // configuración
          IconButton(
            icon: Icon(Icons.settings, color: MyColors.primary),

            onPressed: () {
              // Acción cuando se pulsa el botón
              print('¡Botón de configuración presionado!');
            },
          ),
          // titulo
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          // numero de pares
          InkWell(
            onTap: () {
              // Acción cuando se pulsa el botón
              print('¡Número presionado!');
            },
            child: Container(
              padding: const EdgeInsets.all(Spacing.sm),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Text(
                '4',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
