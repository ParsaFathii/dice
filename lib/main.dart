import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home: Scaffold(
        backgroundColor: Colors.cyan.shade800,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.cyan.shade900,
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  static final _random = Random();

  int _leftDiceNumber = 1;
  int _rightDiceNumber = 1;

  void _rollLeftDice() {
    setState(() => _leftDiceNumber = _random.nextInt(6) + 1);
  }

  void _rollRightDice() {
    setState(() => _rightDiceNumber = _random.nextInt(6) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: _rollLeftDice,
              child: Image.asset('images/dice$_leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: _rollRightDice,
              child: Image.asset('images/dice$_rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
