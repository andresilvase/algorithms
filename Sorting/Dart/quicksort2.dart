import 'dart:math';

List<int> quickSort2(List<int> list) {
  if (list.length <= 1) return list;

  int pivot = list.last;

  List<int> L = [for (var x in list.sublist(0, list.length - 1).where((x) => x <= pivot)) x];

  List<int> R = [for (var x in list.sublist(0, list.length - 1).where((x) => x > pivot)) x];

  L = quickSort2(L);
  R = quickSort2(R);

  return L + [pivot] + R;
}

void main(List<String> args) {
  final List<int> randomBigList = List.generate(
    Random().nextInt(Random().nextInt(100000)),
    (i) => i * Random().nextInt(10000),
  );

  final List<int> list2 = [...randomBigList];
  // final List<int> list2 = [8, 2, 90, 1, 33, 28, 55, 34];
  // print("#QUICKSORT2: $list2");

  final quickWatch2 = Stopwatch()..start();
  quickSort2(list2);
  // final sorted = quickSort2(list2);
  quickWatch2.stop();

  print("#QUICKSORT2 sorted in ${quickWatch2.elapsedMilliseconds}ms");
}
