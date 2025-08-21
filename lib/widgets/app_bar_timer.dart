import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/my_colors.dart';
import 'package:memorizacion_app/design/spacing.dart';
import 'package:memorizacion_app/widgets/buttons/buttons_mode.dart';
import 'package:memorizacion_app/config/app_routes.dart';

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
              Navigator.of(context).pushNamed(AppRoutes.configuration);
            },
          ),
          // titulo
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (_) => AlertDialog(
                      backgroundColor: MyColors.darkContraste,
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: Spacing.lg),
                          child: Text(
                            'Seleccione la categoría',
                            style: TextStyle(
                              color: MyColors.light,
                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      content: SizedBox(
                        width: 390,
                        child: Wrap(
                          spacing: Spacing.xl,
                          runSpacing: Spacing.xl,
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            ButtonMode(
                              title:'Clásico',
                              icon: Icons.timer
                            ),

                            ButtonMode(
                              title:'Filtrado',
                              icon: Icons.sort_by_alpha
                            ),

                            ButtonMode(
                              title:'Incrementar',
                              icon: Icons.text_increase
                            ),
                          ],
                        ),
                      ),
                    ),
              );
            },
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, color: Colors.white),
              ],
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
              decoration: const BoxDecoration(shape: BoxShape.circle),
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


