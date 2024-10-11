int fibn(int n) {
  int a = 0;
  int b = 1;

  final stopwatch = Stopwatch()..start();
  for (int i = 2; i <= n; i++) {
    int temp = a + b;
    a = b;
    b = temp;
  }
  stopwatch.stop();

  print("#FIBO $n: $b runs in ${stopwatch.elapsedMilliseconds}ms");
  return b;
}
