import 'package:db_benchmark/presentation/bloc/benchmark_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BenchmarkConfigurationWidget extends StatefulWidget {
  const BenchmarkConfigurationWidget({super.key});

  @override
  State<BenchmarkConfigurationWidget> createState() =>
      _BenchmarkConfigurationWidgetState();
}

class _BenchmarkConfigurationWidgetState
    extends State<BenchmarkConfigurationWidget> {
  int _countSelectedIndex = 0;
  int _iterationselectedIndex = 0;

  final List<int> _countValues = [
    1000,
    5000,
    10000,
    20000,
    30000,
    50000,
  ];
  final List<int> _repetitionValues = [
    1,
    5,
    10,
    20,
    50,
  ];

  @override
  Widget build(BuildContext context) {
    final benchmarkBloc = context.read<BenchmarkBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Object count: ${_countValues[_countSelectedIndex]}'),
        Slider(
          value: _countSelectedIndex.toDouble(),
          min: 0,
          max: _countValues.length - 1,
          divisions: _countValues.length - 1,
          label: _countValues[_countSelectedIndex].toString(),
          onChanged: (double value) {
            benchmarkBloc.add(
              ChangeBenchmarkConfiguration(
                count: _countValues[value.toInt()],
                iterations: _repetitionValues[_iterationselectedIndex],
              ),
            );
            setState(() {
              _countSelectedIndex = value.toInt();
            });
          },
        ),
        Text('iterations: ${_repetitionValues[_iterationselectedIndex]}'),
        Slider(
          value: _iterationselectedIndex.toDouble(),
          min: 0,
          max: _repetitionValues.length - 1,
          divisions: _repetitionValues.length - 1,
          label: _repetitionValues[_iterationselectedIndex].toString(),
          onChanged: (double value) {
            benchmarkBloc.add(
              ChangeBenchmarkConfiguration(
                count: _countValues[_countSelectedIndex],
                iterations: _repetitionValues[value.toInt()],
              ),
            );
            setState(() {
              _iterationselectedIndex = value.toInt();
            });
          },
        ),
      ],
    );
  }
}
