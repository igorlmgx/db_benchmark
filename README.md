# Benchmark

This project aims to create a benchmark testing ObjectBox and Realm with the following functions:

- input sync
- input many sync
- read all
- query using a date
- remove using a query

Implementations for these tests can be found in the `lib/benchmarks/` directory.

I have created a BLoC to manage state while running different tests, just for fun. If you want to run the tests without BLoC in order to get maximum performance and pureness, set `useBloc` to false. Also update manually object `count` and `iterations` average on the same file.

```dart
lib/main.dart#L50

const useBloc = false;
```

Run the following commands to rebuild entities if you change them:

```bash
dart run build_runner build
flutter pub run realm generate
```

Test results for 20.000 objects with average time of 10 iterations, without BLoC state management:

```
OBX inputSync: 7731 ms
RLM inputSync: 20782 ms
ISR inputSync: 50 ms

OBX inputManySync: 334 ms
RLM inputManySync: 304 ms
ISR inputManySync: 68 ms

OBX readAll: 11 ms
RLM readAll: 0 ms
ISR readAll: 0 ms

OBX testDateQuery: 11 ms
RLM testDateQuery: 0 ms
ISR testDateQuery: 11 ms

OBX testRemoveQuery: 21 ms
RLM testRemoveQuery: 120 ms
ISR testRemoveQuery: 49 ms

ObjectBox memory usage: 1.8MB
```

Device model: Redmi Note 10 Pro, Android 13
