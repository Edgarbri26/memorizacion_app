import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/my_colors.dart';
import 'package:memorizacion_app/design/spacing.dart';

class ButtonMode extends StatelessWidget {
  final String title;
  final IconData icon;
  const ButtonMode({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 110,
      decoration: BoxDecoration(
        color: MyColors.dark,
        borderRadius: BorderRadius.circular(Spacing.xl),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: MyColors.lightGray.withOpacity(0.4),
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(Spacing.md),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacing.xl),
          ),
          backgroundColor: MyColors.dark,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
              margin: const EdgeInsets.only(bottom: Spacing.sm),
              child: Icon(
                icon,
                color: MyColors.primary,
                size: 30,
              ),
            ),
            Text(
              title, 
              style: TextStyle(
                color: MyColors.primary,
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
    );
  }
}