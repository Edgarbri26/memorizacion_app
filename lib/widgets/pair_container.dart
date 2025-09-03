import 'package:flutter/material.dart';

class PairContainer extends StatefulWidget {
  final String generatedPairs;
  final String writtenPairs; // Nuevo parámetro opcional
  final bool isRunning;
  const PairContainer({super.key, required this.generatedPairs,  required this.writtenPairs, required this.isRunning });

  @override
  State<PairContainer> createState() => _PairContainerState();
}

class _PairContainerState extends State<PairContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          Text( 
            'Pares:',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.generatedPairs,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10), // Espacio entre los textos
          if (widget.writtenPairs.isNotEmpty && !widget.isRunning) ...[  
          Text( 
            'Pares Escritos:',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.writtenPairs,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ],
        ],
      ),
    );
  }
}
