import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/my_colors.dart';
import 'package:memorizacion_app/design/spacing.dart';

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
          // BoxShadow(
          //   color: MyColors.darkContraste,
          //   blurRadius: 5.0,
          //   spreadRadius: 1.0,
          //   offset: const Offset(2, -2),
          // ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.xs,
          horizontal: Spacing.lg,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Icono de reloj
            IconButton(
              onPressed: () {
                print("timer");
              },
              icon: Icon(Icons.timer, color: MyColors.primary, size: 30),
            ),
            IconButton(
              onPressed: () {
                print("lista");
              },
              icon: Icon(
                Icons.list_alt_rounded,
                color: MyColors.light.withOpacity(0.5),
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                print("estadistica");
              },
              icon: Icon(
                Icons.bar_chart,
                color: MyColors.light.withOpacity(0.5),
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
