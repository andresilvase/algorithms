// Time complexity: 𝑂(n^2) | Can be 𝑂(n) for when the list is already sorted, best case.
// Space complexity: 𝑂(1)
// Stability: Yes
// Recusion: No
// In-place: Yes
// DC: No

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
