import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/my_colors.dart';
import 'package:memorizacion_app/widgets/app_bar_timer.dart';
import 'package:memorizacion_app/widgets/bodyhome.dart';
import 'package:memorizacion_app/widgets/nav_bar.dart';
import 'package:memorizacion_app/services/pairs.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyHomePage extends StatefulWidget {
  // final String title;
  const MyHomePage({super.key, required});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  // final DatabaseServices _databaseServices = DatabaseServices.instance;
  final Pairs _pairs = Pairs();
  int _selectedIndex = 0;
  bool _isTimerRunning = false;
  String _numPairs = '00';
  String _omittedPairs = '';
  String _omittedLetters = '';


    @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _omittedPairs = prefs.getString('omittedPairs') ?? '';
      _omittedLetters = prefs.getString('omittedLetters') ?? '';
      _numPairs = prefs.getString('numPairs') ?? '5';
    });
  }

  void _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('numPairs', _numPairs);
  }





  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateTimerState(bool isRunning) {
    setState(() {
      _isTimerRunning = isRunning;
    });
  }
  
  void _updateNumPairs(String newNum) {
    setState(() {
      _numPairs = newNum;
      _saveSettings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark, // Fondo oscuro
      appBar: _isTimerRunning ? null : AppBar(
        backgroundColor: MyColors.dark, // Fondo oscuro para la AppBar
        elevation: 0, // Sin sombra
        title: AppBarTimer(
          onPressedNum: _updateNumPairs,
          numPairs: _numPairs,
          title: 'Clasico',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: 
              Bodyhome(
                omittedLetters: _omittedLetters,
                omittedPairs: _omittedPairs,
                pairs: _pairs,
                numPairs: int.parse(_numPairs),
                onTimerStateChanged: _updateTimerState,
              ),
              // Barra de navegación inferior
              // NavBar(),
        ),
      ),
    );
  }
}
