import 'dart:collection';

import 'package:db_benchmark/benchmarks/objectbox_benchmark.dart' as obx;
import 'package:db_benchmark/benchmarks/realm_benchmark.dart' as rlm;
import 'package:db_benchmark/benchmarks/isar_benchmark.dart' as isr;
import 'package:db_benchmark/benchmarks/sqflite_benchmark.dart' as sqf;
import 'package:db_benchmark/benchmarks/shared_preferences_benchmark.dart'
    as shr;
import 'package:db_benchmark/entities/test_item.dart';

class TestQueue {
  static Map<String, dynamic> get getTestList {
    return {
      'SHR inputSync': null,
      'OBX inputSync': null,
      'RLM inputSync': null,
      'ISR inputSync': null,
      'SQF inputSync': null,
      'SHR inputManySync': null,
      'OBX inputManySync': null,
      'RLM inputManySync': null,
      'ISR inputManySync': null,
      'SQF inputManySync': null,
      'SHR readAll': null,
      'OBX readAll': null,
      'RLM readAll': null,
      'ISR readAll': null,
      'SQF readAll': null,
      'SHR dateQuery': null,
      'OBX dateQuery': null,
      'RLM dateQuery': null,
      'ISR dateQuery': null,
      'SQF dateQuery': null,
      'SHR removeQuery': null,
      'OBX removeQuery': null,
      'RLM removeQuery': null,
      'ISR removeQuery': null,
      'SQF removeQuery': null,
    };
  }

  static Queue<TestItem> get testQueue {
    final Queue<TestItem> queue = Queue<TestItem>();

    queue.addAll([
      TestItem(
        testFuncion: shr.testInputSync,
        functionName: 'SHR inputSync',
      ),
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
        testFuncion: sqf.testInputSync,
        functionName: 'SQF inputSync',
      ),
      TestItem(
        testFuncion: shr.testInputManySync,
        functionName: 'SHR inputManySync',
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
        testFuncion: sqf.testInputManySync,
        functionName: 'SQF inputManySync',
      ),
      TestItem(
        testFuncion: shr.testReadAll,
        functionName: 'SHR readAll',
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
        testFuncion: sqf.testReadAll,
        functionName: 'SQF readAll',
      ),
      TestItem(
        testFuncion: shr.testDateQuery,
        functionName: 'SHR dateQuery',
      ),
      TestItem(
        testFuncion: obx.testDateQuery,
        functionName: 'OBX dateQuery',
      ),
      TestItem(
        testFuncion: rlm.testDateQuery,
        functionName: 'RLM dateQuery',
      ),
      TestItem(
        testFuncion: isr.testDateQuery,
        functionName: 'ISR dateQuery',
      ),
      TestItem(
        testFuncion: sqf.testDateQuery,
        functionName: 'SQF dateQuery',
      ),
      TestItem(
        testFuncion: shr.testRemoveQuery,
        functionName: 'SHR removeQuery',
      ),
      TestItem(
        testFuncion: obx.testRemoveQuery,
        functionName: 'OBX removeQuery',
      ),
      TestItem(
        testFuncion: rlm.testRemoveQuery,
        functionName: 'RLM removeQuery',
      ),
      TestItem(
        testFuncion: isr.testRemoveQuery,
        functionName: 'ISR removeQuery',
      ),
      TestItem(
        testFuncion: sqf.testRemoveQuery,
        functionName: 'SQF removeQuery',
      ),
    ]);

    return queue;
  }
}
