class TestItem {
  final Future<int> Function(int) testFuncion;
  final String functionName;

  TestItem({
    required this.testFuncion,
    required this.functionName,
  });
}
