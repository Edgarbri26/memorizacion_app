import 'dart:async';
import 'package:memorizacion_app/services/pairs.dart';
import 'package:memorizacion_app/widgets/pair_container.dart';
import 'package:flutter/material.dart';
import 'package:memorizacion_app/design/spacing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bodyhome extends StatefulWidget {
  final ValueChanged<bool> onTimerStateChanged;
  final int numPairs;
  final Pairs pairs;
  final String omittedPairs;
  final String omittedLetters;
  const Bodyhome({
    super.key,
    required this.onTimerStateChanged,
    required this.numPairs,
    required this.pairs,
    required this.omittedPairs,
    required this.omittedLetters,
  });

  @override
  State<Bodyhome> createState() => _BodyhomeState();
}

class _BodyhomeState extends State<Bodyhome> {
  // final Pares _pares = Pares();
  bool _isRunning = false;
  int _elapsedTime = 0;
  Timer? _timer;
  int points = 0;

  void _startStopTimer() {
    setState(() {
      if (_isRunning) {
        _timer?.cancel();
      } else {
        _elapsedTime = 0;
        _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
          setState(() {
            _elapsedTime += 10;
          });
        });
      }
      _isRunning = !_isRunning;
      widget.onTimerStateChanged(_isRunning);
    });
  }

  void _generatedPairs() {
    widget.pairs.generatedPairs = widget.pairs.generatePairs(
      widget.numPairs,
      widget.omittedPairs.split(' '),
      widget.omittedLetters.split(' '),
    );
  }

  String _formatTime(int milliseconds) {
    final int seconds = (milliseconds ~/ 1000);
    final int minutes = (seconds ~/ 60);
    final int remainingSeconds = (seconds % 60);
    final int remainingMilliseconds = (milliseconds % 1000) ~/ 10;

    String formattedTime = '';

    if (minutes > 0) {
      formattedTime +=
          '${minutes.toString()}:${remainingSeconds.toString().padLeft(2, '0')}.';
    } else {
      formattedTime += '${remainingSeconds.toString()}.';
    }
    formattedTime += remainingMilliseconds.toString().padLeft(2, '0');

    return formattedTime;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Pares
        PairContainer(
          generatedPairs: widget.pairs.generatedPairs.join(' '),
          writtenPairs: 'ds ds sd', //_pares.writtenPairs.join(' '),
          isRunning: _isRunning,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              if (!_isRunning) {
                _generatedPairs();
              }
              _startStopTimer();
            },
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (!_isRunning)
                        Text(
                          '5/6',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 72.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      Text(
                        _formatTime(_elapsedTime),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _isRunning ? 50 : 24,
                        ),
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
                    child:
                        _isRunning
                            ? SizedBox.shrink()
                            : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Media: 3.5',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Mejor: 3/4 7.5s',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'cuenta: 10',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
