import 'package:flutter/material.dart';

class PairContainer extends StatelessWidget {
  final String generatedPairs;
  final String writtenPairs;
  const PairContainer({super.key, required this.generatedPairs, required this.writtenPairs});

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
            generatedPairs,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10), // Espacio entre los textos
          Text( 
            'Pares Escritos:',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          Text(
            writtenPairs,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
