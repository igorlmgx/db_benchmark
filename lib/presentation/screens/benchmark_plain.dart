import 'dart:collection';

import 'package:db_benchmark/entities/test_item.dart';
import 'package:flutter/material.dart';

class BenchmarkPlain extends StatelessWidget {
  const BenchmarkPlain({
    super.key,
    required this.count,
    required this.iterations,
    required this.queue,
  });

  final int count;
  final int iterations;
  final Queue<TestItem> queue;

  int runTest(int Function(int) testFuncion) {
    int totalTime = 0;
    for (int i = 0; i < iterations; i++) {
      totalTime += testFuncion(count);
    }
    return (totalTime / iterations).round();
  }

  List<String> getTestResults() {
    List<String> testResults = [];

    while (queue.isNotEmpty) {
      int result = runTest(queue.first.testFuncion);
      testResults.add('${queue.first.functionName}: $result ms');
      queue.removeFirst();
    }

    return testResults;
  }

  @override
  Widget build(BuildContext context) {
    final testResults = getTestResults();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < testResults.length; i++)
            Padding(
              padding: EdgeInsets.only(
                bottom: i % 2 == 0 ? 0 : 10,
              ),
              child: Text(testResults[i]),
            ),
        ],
      ),
    );
  }
}
