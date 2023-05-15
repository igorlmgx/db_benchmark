import 'package:bloc/bloc.dart';

part 'benchmark_event.dart';
part 'benchmark_state.dart';

class BenchmarkBloc extends Bloc<BenchmarkEvent, BenchmarkState> {
  BenchmarkBloc({
    required Map<String, dynamic> benchmarkResults,
  }) : super(
          BenchmarkInitial(
            benchmarkResults: benchmarkResults,
            count: 1000,
            iterations: 1,
          ),
        ) {
    on<ChangeBenchmarkConfiguration>(_changeBenchmarkConfiguration);
    on<FinishBenchmark>(_finishBenchmark);
    on<RunBenchmark>(_runBenchmark);
  }

  void _changeBenchmarkConfiguration(
      ChangeBenchmarkConfiguration event, Emitter<BenchmarkState> emit) {
    if (state is BenchmarkInitial) {
      emit(
        BenchmarkInitial(
          benchmarkResults: state.benchmarkResults,
          count: event.count,
          iterations: event.iterations,
        ),
      );
    } else if (state is BenchmarkFinished) {
      emit(
        BenchmarkFinished(
          benchmarkResults: state.benchmarkResults,
          count: event.count,
          iterations: event.iterations,
        ),
      );
    }
  }

  void _finishBenchmark(FinishBenchmark event, Emitter<BenchmarkState> emit) {
    emit(BenchmarkFinished(
      benchmarkResults: state.benchmarkResults,
      count: state.count,
      iterations: state.iterations,
    ));
  }

  void _runBenchmark(RunBenchmark event, Emitter<BenchmarkState> emit) async {
    final benchmarks = state.benchmarkResults;
    final functionName = event.functionName;

    benchmarks.update(
      functionName,
      (value) => 'Running 0/${state.iterations}',
      ifAbsent: () => 'Running',
    );

    emit(
      BenchmarkRunning(
        benchmarkResults: benchmarks,
        count: state.count,
        iterations: state.iterations,
      ),
    );

    int totalTime = 0;

    for (int i = 0; i < state.iterations; i++) {
      await Future.delayed(const Duration(milliseconds: 50));

      try {
        totalTime += event.testFunction(state.count);
      } catch (e) {
        emit(
          BenchmarkFailed(
            errorMessage: e.toString(),
            benchmarkResults: benchmarks,
            count: state.count,
            iterations: state.iterations,
          ),
        );
      }

      benchmarks.update(
        functionName,
        (value) => 'Running ${i + 1}/${state.iterations}',
      );

      emit(
        BenchmarkRunning(
          benchmarkResults: benchmarks,
          count: state.count,
          iterations: state.iterations,
        ),
      );
    }

    benchmarks[functionName] = '${totalTime / state.iterations} ms';

    emit(
      BenchmarkReady(
        benchmarkResults: benchmarks,
        count: state.count,
        iterations: state.iterations,
      ),
    );
  }
}
