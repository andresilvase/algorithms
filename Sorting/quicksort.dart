// Time complexity: 𝑂(n log n) - Worst scenario can be 𝑂(nˆ2)
// Space complexity: 𝑂(log n)
// Stability: No
// Recusion: Yes
// In-place: Yes
// DC: Yes

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

List<int> quickSort2(List<int> list) {
  if (list.length <= 1) return list;

  int pivot = list.last;

  List<int> L = [
    for (var x in list.sublist(0, list.length - 1).where((x) => x <= pivot)) x
  ];

  List<int> R = [
    for (var x in list.sublist(0, list.length - 1).where((x) => x > pivot)) x
  ];

  L = quickSort2(L);
  R = quickSort2(R);

  return L + [pivot] + R;
}
