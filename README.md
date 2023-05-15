# Benchmark

This project aims to create a benchmark testing ObjectBox and Realm with the following functions:

- input sync
- input many sync
- read all
- query using a date
- remove using a query

Implementations for these tests can be found in the `lib/benchmarks/` directory.

I have created a BLoC to manage state while running different tests, just for fun. If you want to run the tests without BLoC in order to get maximum performance and pureness, set `useBloc` to false. Also update manually

```dart
lib/main.dart#L50

const useBloc = false;
```

Run the following commands to rebuild entities if you change them:

```bash
flutter pub run build_runner build
flutter pub run realm generate
```

Test results for 20.000 objects with average time of 10 iterations, without BLoC state management:

```
OBX inputSync: 7254 ms
RLM inputSync: 21680 ms

OBX inputManySync: 36 ms
RLM inputManySync: 300 ms

OBX readAll: 9 ms
RLM readAll: 0 ms

OBX testDateQuery: 10 ms
RLM testDateQuery: 0 ms

OBX testRemoveQuery: 13 ms
RLM testRemoveQuery: 119 ms

ObjectBox memory usage: 1.8MB
```

Device model: Redmi Note 10 Pro, Android 13
