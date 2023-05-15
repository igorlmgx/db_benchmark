import 'dart:collection';

import 'package:db_benchmark/benchmarks/objectbox_benchmark.dart' as obx;
import 'package:db_benchmark/benchmarks/realm_benchmark.dart' as rlm;
import 'package:db_benchmark/entities/test_item.dart';

class TestQueue {
  static Map<String, dynamic> get getTestList {
    return {
      'OBX inputSync': null,
      'RLM inputSync': null,
      'OBX inputManySync': null,
      'RLM inputManySync': null,
      'OBX readAll': null,
      'RLM readAll': null,
      'OBX testDateQuery': null,
      'RLM testDateQuery': null,
      'OBX testRemoveQuery': null,
      'RLM testRemoveQuery': null,
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
        testFuncion: obx.testInputManySync,
        functionName: 'OBX inputManySync',
      ),
      TestItem(
        testFuncion: rlm.testInputManySync,
        functionName: 'RLM inputManySync',
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
        testFuncion: obx.testDateQuery,
        functionName: 'OBX testDateQuery',
      ),
      TestItem(
        testFuncion: rlm.testDateQuery,
        functionName: 'RLM testDateQuery',
      ),
      TestItem(
        testFuncion: obx.testRemoveQuery,
        functionName: 'OBX testRemoveQuery',
      ),
      TestItem(
        testFuncion: rlm.testRemoveQuery,
        functionName: 'RLM testRemoveQuery',
      ),
    ]);

    return queue;
  }
}
