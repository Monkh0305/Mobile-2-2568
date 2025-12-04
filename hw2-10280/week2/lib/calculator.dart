import 'package:flutter/material.dart';

class CalculatorUI extends StatelessWidget {
  const CalculatorUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    buildButtonRow(
                      ["C", "+/-", "%", "÷"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["7", "8", "9", "x"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["4", "5", "6", "-"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["1", "2", "3", "+"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["0", ".", "="],
                      isOperator: [false, false, false, true],
                      isDoubleZero: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(
    List<String> labels, {
    required List<bool> isOperator,
    bool isDoubleZero = false,
  }) {
    return Expanded(
      child: Row(
        children: List.generate(labels.length, (index) {
          final bool isZeroButton = isDoubleZero && index == 0;

          return Expanded(
            flex: isZeroButton ? 2 : 1,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: isZeroButton ? null : 120,
                height: 90,
                decoration: isZeroButton
                    ? BoxDecoration(
                        color: isOperator[index]
                            ? Colors.orange
                            : Colors.grey[850],
                        borderRadius: BorderRadius.circular(40),
                      )
                    : BoxDecoration(
                        color: isOperator[index]
                            ? Colors.orange
                            : Colors.grey[850],
                        shape: BoxShape.circle,
                      ),
                child: Center(
                  child: Text(
                    labels[index],
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
