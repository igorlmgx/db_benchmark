// ignore_for_file: dead_code

import 'package:db_benchmark/databases/isar.dart';
import 'package:db_benchmark/databases/objectbox.dart';
import 'package:db_benchmark/entities/test_queue.dart';
import 'package:db_benchmark/presentation/bloc/benchmark_bloc.dart';
import 'package:db_benchmark/presentation/screens/benchmark_plain.dart';
import 'package:db_benchmark/presentation/screens/benchmark_with_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:db_benchmark/databases/sqflite.dart';

late ObjectBox objectboxDB;
late Isar isar;
late Database sqflite;

void main() async {
  await Future.delayed(const Duration(seconds: 6));

  WidgetsFlutterBinding.ensureInitialized();

  objectboxDB = await ObjectBox.create();
  isar = await openIsar();
  sqflite = await SqfliteDB.open();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Benchmark'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Change this to use bloc state management to see progress
    // or use plain benchmark to maximum performance and memory isolation
    const bool useBloc = true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: useBloc
          ? BlocProvider(
              create: (_) => BenchmarkBloc(
                benchmarkResults: TestQueue.getTestList,
              ),
              child: BenchmarkWithBloc(
                queue: TestQueue.testQueue,
              ),
            )
          : BenchmarkPlain(
              count: 20000,
              iterations: 1,
              queue: TestQueue.testQueue,
            ),
    );
  }
}
