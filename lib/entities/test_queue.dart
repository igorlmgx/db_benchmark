import 'dart:collection';

import 'package:db_benchmark/benchmarks/objectbox_benchmark.dart' as obx;
import 'package:db_benchmark/benchmarks/realm_benchmark.dart' as rlm;
import 'package:db_benchmark/benchmarks/isar_benchmark.dart' as isr;
import 'package:db_benchmark/entities/test_item.dart';

class TestQueue {
  static Map<String, dynamic> get getTestList {
    return {
      'OBX inputSync': null,
      'RLM inputSync': null,
      'ISR inputSync': null,
      'OBX inputManySync': null,
      'RLM inputManySync': null,
      'ISR inputManySync': null,
      'OBX readAll': null,
      'RLM readAll': null,
      'ISR readAll': null,
      'OBX testDateQuery': null,
      'RLM testDateQuery': null,
      'ISR testDateQuery': null,
      'OBX testRemoveQuery': null,
      'RLM testRemoveQuery': null,
      'ISR testRemoveQuery': null,
    };
  }

  static Queue<TestItem> get testQueue {
    final Queue<TestItem> queue = Queue<TestItem>();

    queue.addAll([
      TestItem(
        testFuncion: obx.testInputSync,
        functionName: 'OBX inputSync',
      ),
      TestItem(
        testFuncion: rlm.testInputSync,
        functionName: 'RLM inputSync',
      ),
      TestItem(
        testFuncion: isr.testInputSync,
        functionName: 'ISR inputSync',
      ),
      TestItem(
        testFuncion: obx.testInputManySync,
        functionName: 'OBX inputManySync',
      ),
      TestItem(
        testFuncion: rlm.testInputManySync,
        functionName: 'RLM inputManySync',
      ),
      TestItem(
        testFuncion: isr.testInputManySync,
        functionName: 'ISR inputManySync',
      ),
      TestItem(
        testFuncion: obx.testReadAll,
        functionName: 'OBX readAll',
      ),
      TestItem(
        testFuncion: rlm.testReadAll,
        functionName: 'RLM readAll',
      ),
      TestItem(
        testFuncion: isr.testReadAll,
        functionName: 'ISR readAll',
      ),
      TestItem(
        testFuncion: obx.testDateQuery,
        functionName: 'OBX testDateQuery',
      ),
      TestItem(
        testFuncion: rlm.testDateQuery,
        functionName: 'RLM testDateQuery',
      ),
      TestItem(
        testFuncion: isr.testDateQuery,
        functionName: 'ISR testDateQuery',
      ),
      TestItem(
        testFuncion: obx.testRemoveQuery,
        functionName: 'OBX testRemoveQuery',
      ),
      TestItem(
        testFuncion: rlm.testRemoveQuery,
        functionName: 'RLM testRemoveQuery',
      ),
      TestItem(
        testFuncion: isr.testRemoveQuery,
        functionName: 'ISR testRemoveQuery',
      ),
    ]);

    return queue;
  }
}
