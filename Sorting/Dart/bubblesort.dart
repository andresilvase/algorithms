// Time complexity: 𝑂(n^2)
// Space complexity: 𝑂(1)
// Stability: Yes
// Recusion: No
// In-place: Yes
// DC: No

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
