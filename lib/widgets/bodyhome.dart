import 'package:flutter/material.dart';

class Bodyhome extends StatefulWidget {
  const Bodyhome({super.key});

  @override
  State<Bodyhome> createState() => _BodyhomeState();
}

class _BodyhomeState extends State<Bodyhome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
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
              Text('Mejor: 3/4 7.5s', style: TextStyle(color: Colors.white)),
              Text('cuenta: 10', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
