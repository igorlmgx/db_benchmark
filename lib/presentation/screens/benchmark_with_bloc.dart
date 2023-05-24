import 'dart:collection';

import 'package:db_benchmark/entities/test_item.dart';
import 'package:db_benchmark/entities/test_queue.dart';
import 'package:db_benchmark/presentation/bloc/benchmark_bloc.dart';
import 'package:db_benchmark/presentation/widgets/benchmark_configuration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BenchmarkWithBloc extends StatefulWidget {
  const BenchmarkWithBloc({super.key, required this.queue});
  final Queue<TestItem> queue;

  @override
  State<BenchmarkWithBloc> createState() => _BenchmarkWithBlocState();
}

class _BenchmarkWithBlocState extends State<BenchmarkWithBloc> {
  late Queue<TestItem> _queue;

  @override
  void initState() {
    _queue = widget.queue;
    super.initState();
  }

  void runNextTest(BenchmarkBloc bloc) {
    if (bloc.state is! BenchmarkFailed) {
      bloc.add(
        RunBenchmark(
          testFunction: _queue.first.testFuncion,
          functionName: _queue.first.functionName,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final benchmarkBloc = context.read<BenchmarkBloc>();

    return BlocConsumer<BenchmarkBloc, BenchmarkState>(
      listener: (context, state) {
        if (state is BenchmarkReady) {
          _queue.removeFirst();

          if (_queue.isNotEmpty) {
            runNextTest(benchmarkBloc);
          } else {
            benchmarkBloc.add(FinishBenchmark());
          }
        }
      },
      builder: (context, state) {
        final results = state.benchmarkResults.entries;
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < results.length; i++)
                Padding(
                  padding: EdgeInsets.only(
                    top: i % 4 == 0 ? 10 : 0,
                  ),
                  child: Text(
                      '${results.elementAt(i).key}: ${results.elementAt(i).value ?? ''}'),
                ),
              const SizedBox(
                height: 20,
              ),
              if (state is BenchmarkInitial || state is BenchmarkFinished)
                const BenchmarkConfigurationWidget(),
              const SizedBox(
                height: 20,
              ),
              if (state is BenchmarkInitial)
                TextButton(
                  onPressed: () => runNextTest(benchmarkBloc),
                  child: const Text(
                    'Run tests',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              if (state is BenchmarkFinished || state is BenchmarkFailed)
                TextButton(
                  onPressed: () => setState(() {
                    _queue = TestQueue.testQueue;
                    runNextTest(benchmarkBloc);
                  }),
                  child: const Text(
                    'Run tests again',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              if (state is BenchmarkFailed) Text(state.errorMessage),
            ],
          ),
        );
      },
    );
  }
}
