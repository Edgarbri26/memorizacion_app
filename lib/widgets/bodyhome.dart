import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/spacing.dart';

class Bodyhome extends StatefulWidget {
  const Bodyhome({super.key});

  @override
  State<Bodyhome> createState() => _BodyhomeState();
}

class _BodyhomeState extends State<Bodyhome> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Acción cuando se pulsa la puntuación
          print('¡Puntuación presionada!');
        },
        child: Column(
          children: const [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '5/6',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 72.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '10.23',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                ],
              ),
            ),
            // Estadísticas
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Spacing.sm,
                horizontal: 0.0,
              ),
              child: Align(
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
            ),
          ],
        ),
      ),
    );
  }
}
