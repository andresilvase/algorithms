// Time complexity: 𝑂(n log n) - Worst scenario can be 𝑂(nˆ2)
// Space complexity: 𝑂(log n)
// Stability: No
// Recusion: Yes
// In-place: Yes
// DC: Yes

import 'dart:math';

void quickSort(List<int> list, int left, int right) {
  if (left < right) {
    int pivotIndex = partition(list, left, right);

    quickSort(list, left, pivotIndex - 1);
    quickSort(list, pivotIndex + 1, right);
  }
}

int partition(List<int> list, int left, int right) {
  int pivot = list[right];

  int currentLastSmallerThanPivotIndex = left - 1;

  for (int i = left; i < right; i++) {
    if (list[i] <= pivot) {
      currentLastSmallerThanPivotIndex++;

      if (currentLastSmallerThanPivotIndex < i) {
        swap(list, currentLastSmallerThanPivotIndex, i);
      }
    }
  }
  currentLastSmallerThanPivotIndex++;
  swap(list, currentLastSmallerThanPivotIndex, right);

  return currentLastSmallerThanPivotIndex;
}

void swap(List<int> list, int index1, index2) {
  int temp = list[index1];
  list[index1] = list[index2];
  list[index2] = temp;
}

void main() {
  final List<int> randomBigList = List.generate(
    Random().nextInt(Random().nextInt(100000)),
    (i) => i * Random().nextInt(10000),
  );

  final List<int> list = [...randomBigList];
  // final List<int> list = [8, 2, 90, 1, 33, 28, 55, 34];
  // print("#QUICKSORT: $list");

  final quickWatch = Stopwatch()..start();
  quickSort(list, 0, list.length - 1);
  quickWatch.stop();

  print("#QUICKSORT sorted in ${quickWatch.elapsedMilliseconds}ms");
}
