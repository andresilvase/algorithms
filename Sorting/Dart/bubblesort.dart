// Time complexity: 𝑂(n^2)
// Space complexity: 𝑂(1)
// Stability: Yes
// Recusion: No
// In-place: Yes
// DC: No

import 'dart:math';

void bubblesort(List<int> arr) {
  bool sorted = false;

  while (!sorted) {
    sorted = true;
    for (int i = 1; i < arr.length; i++) {
      if (arr[i] < arr[i - 1]) {
        sorted = false;
        swap(arr, i - 1, i);
      }
    }
  }
}

void swap(List<int> arr, int a, int b) {
  int temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

void main() {
  final List<int> randomBigList = List.generate(
    Random().nextInt(Random().nextInt(100000)),
    (i) => i * Random().nextInt(10000),
  );

  final List<int> bubbleList = [...randomBigList];

  final bubbleWatch2 = Stopwatch()..start();
  bubblesort(bubbleList);
  bubbleWatch2.stop();

  print("#BUBBLESORT sorted in ${bubbleWatch2.elapsedMilliseconds}ms");
}
