part of 'benchmark_bloc.dart';

abstract class BenchmarkState {
  final Map<String, dynamic> benchmarkResults;
  final int count;
  final int iterations;

  BenchmarkState({
    required this.benchmarkResults,
    required this.count,
    required this.iterations,
  });
}

class BenchmarkInitial extends BenchmarkState {
  BenchmarkInitial({
    required super.benchmarkResults,
    required super.count,
    required super.iterations,
  });
}

class BenchmarkRunning extends BenchmarkState {
  BenchmarkRunning({
    required super.benchmarkResults,
    required super.count,
    required super.iterations,
  });
}

class BenchmarkReady extends BenchmarkState {
  BenchmarkReady({
    required super.benchmarkResults,
    required super.count,
    required super.iterations,
  });
}

class BenchmarkFinished extends BenchmarkState {
  BenchmarkFinished({
    required super.benchmarkResults,
    required super.count,
    required super.iterations,
  });
}

class BenchmarkFailed extends BenchmarkState {
  final String errorMessage;
  BenchmarkFailed({
    required this.errorMessage,
    required super.benchmarkResults,
    required super.count,
    required super.iterations,
  });
}
