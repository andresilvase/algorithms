import './data.dart';

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
  final quickWatch = Stopwatch()..start();
  quickSort2(fuckingBigList);
  quickWatch.stop();
  print("Dart Elapsed time ${quickWatch.elapsed.inSeconds} seconds.");
}
