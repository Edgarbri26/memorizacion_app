import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final TextEditingController _omittedPairsController = TextEditingController();
  final TextEditingController _omittedLettersController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  // Carga las configuraciones guardadas
  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _omittedPairsController.text = prefs.getString('omittedPairs') ?? '';
      _omittedLettersController.text = prefs.getString('omittedLetters') ?? '';
    });
  }

  // Guarda las configuraciones
  void _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('omittedPairs', _omittedPairsController.text);
    await prefs.setString('omittedLetters', _omittedLettersController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Configuraciones guardadas 🎉')),
    );
  }

  @override
  void dispose() {
    _omittedPairsController.dispose();
    _omittedLettersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Pares omitidos (separados por coma):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _omittedPairsController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ej. ab, cd, ef',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Letras omitidas (separadas por coma):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _omittedLettersController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ej. a, b, c',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Guardar', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}