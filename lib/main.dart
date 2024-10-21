import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('VIVAS'),
          foregroundColor: Colors.amber,
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1, right = 1, total = 2;
  String result = "Roll the dice!";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/dice$left.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/dice$right.png'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Total Roll: $total',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.amber, // Set text to gold
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            result,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          // Roll Dice Button
          ElevatedButton(
            onPressed: () {
              setState(() {
                ChangeValue();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text(
              'Roll Dice',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Reset Button
          ElevatedButton(
            onPressed: () {
              setState(() {
                ResetDice();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text(
              'Reset',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
  void ChangeValue() {
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
    total = left + right;

    if (left > right) {
      result = 'Left dice is higher!';
    } else if (right > left) {
      result = 'Right dice is higher!';
    } else {
      result = 'It\'s a tie!';
    }
  }
  void ResetDice() {
    left = 1;
    right = 1;
    total = 2;
    result = "Roll the dice!";
  }
}
