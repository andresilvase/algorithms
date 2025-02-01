import 'dart:io';

final Map momoizationMap = {};

int memoizationFake(int num) {
  final stopWatch = Stopwatch()..start();

  if (momoizationMap.containsKey(num)) {
    stopWatch.stop();
    print("#MEMOIZATION $num runs in ${stopWatch.elapsedMilliseconds}ms");
    return momoizationMap[num];
  }

  sleep(Duration(seconds: 1));
  momoizationMap[num] = num;

  stopWatch.stop();
  print("#MEMOIZATION $num runs in ${stopWatch.elapsedMilliseconds}ms");
  return num * num;
}

void main() {
  memoizationFake(4);
  memoizationFake(8);
  memoizationFake(4);
  memoizationFake(8);
}
