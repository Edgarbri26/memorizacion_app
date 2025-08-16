import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/colors.dart';

class MyHomePage extends StatefulWidget {
  
  final String title;
  const MyHomePage({super.key, required this.title});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        backgroundColor: MyColors.primary,
        title: Text("appBar title", style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: MyColors.light),),
      ),
    );
  }
}
