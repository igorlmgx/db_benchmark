part of 'benchmark_bloc.dart';

abstract class BenchmarkEvent {}

class ChangeBenchmarkConfiguration extends BenchmarkEvent {
  final int count;
  final int iterations;

  ChangeBenchmarkConfiguration({
    required this.count,
    required this.iterations,
  });
}

class RunBenchmark extends BenchmarkEvent {
  final int Function(int) testFunction;
  final String functionName;
  RunBenchmark({
    required this.testFunction,
    required this.functionName,
  });
}

class FinishBenchmark extends BenchmarkEvent {}
