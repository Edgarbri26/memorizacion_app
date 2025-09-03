import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memorizacion_app/design/my_colors.dart';
import 'package:memorizacion_app/design/spacing.dart';
import 'package:memorizacion_app/widgets/buttons/buttons_mode.dart';
import 'package:memorizacion_app/config/app_routes.dart';

class AppBarTimer extends StatefulWidget {
  final ValueChanged<String> onPressedNum;
  final String numPairs;
  final String title;

  const AppBarTimer({
    super.key,
    required this.onPressedNum,
    required this.numPairs,
    required this.title,
  });

  @override
  State<AppBarTimer> createState() => _AppBarTimerState();
}

class _AppBarTimerState extends State<AppBarTimer> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.xs),
        child: Container(
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
                  Navigator.of(context).pushNamed(AppRoutes.settings);
                },
              ),
              // titulo  y selector de categoría
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          backgroundColor: MyColors.darkContraste,
                          title: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: Spacing.lg,
                              ),
                              child: Text(
                                'Seleccione la categoría',
                                style: TextStyle(
                                  color: MyColors.light,
                                  fontSize:
                                      Theme.of(
                                        context,
                                      ).textTheme.bodyMedium?.fontSize,
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
                                ButtonMode(title: 'Clásico', icon: Icons.timer),

                                ButtonMode(
                                  title: 'Filtrado',
                                  icon: Icons.sort_by_alpha,
                                ),

                                ButtonMode(
                                  title: 'Incrementar',
                                  icon: Icons.text_increase,
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
                      widget.title,
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
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Ingresa un número'),
                        content: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              widget.onPressedNum(_controller.text);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(Spacing.sm),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Text(
                    widget.numPairs,
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
        ),
      ),
    );
  }
}
