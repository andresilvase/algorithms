// Time complexity: 𝑂(n^2) | Can be 𝑂(n) for when the list is already sorted, best case.
// Space complexity: 𝑂(1)
// Stability: Yes
// Recusion: No
// In-place: Yes
// DC: No

import 'dart:math';

void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    final int currentElement = arr[i];
    int j = i - 1;

    while (j >= 0 && arr[j] > currentElement) {
      arr[j + 1] = arr[j];
      j--;
    }

    arr[j + 1] = currentElement;
  }
}

void main() {
  final List<int> randomBigList = List.generate(
    Random().nextInt(Random().nextInt(100000)),
    (i) => i * Random().nextInt(10000),
  );

  final List<int> insertList = [...randomBigList];

  final insertWatch2 = Stopwatch()..start();
  insertionSort(insertList);
  insertWatch2.stop();

  print("#INSERTIONSORT sorted in ${insertWatch2.elapsedMilliseconds}ms");
}
