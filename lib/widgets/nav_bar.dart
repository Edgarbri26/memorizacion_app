import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/my_colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.darkContraste,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: const Offset(2, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Icono de reloj
            const Icon(Icons.timer, color: Colors.green, size: 30),
            // Icono de documento
            Icon(
              Icons.list_alt_rounded,
              color: Colors.white.withOpacity(0.5),
              size: 30,
            ),
            // Icono de gráfico
            Icon(
              Icons.bar_chart,
              color: Colors.white.withOpacity(0.5),
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
