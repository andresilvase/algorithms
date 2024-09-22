// Time complexity: 𝑂(n log n)
// Space complexity: 𝑂(n)
// Stability: Yes
// Recusion: Yes
// In-place: No
// DC: Yes

List<int> mergeSort(List<int> arr) {
  final arrLen = arr.length;

  if (arrLen == 1) return arr;

  final mid = arrLen ~/ 2;

  var left = arr.sublist(0, mid);
  var right = arr.sublist(mid);

  left = mergeSort(left);
  right = mergeSort(right);

  return merge(arr, left, right);
}

List<int> merge(List<int> arr, List<int> left, List<int> right) {
  int arrI = 0, leftJ = 0, rightK = 0;

  while (leftJ < left.length && rightK < right.length) {
    if (left[leftJ] < right[rightK]) {
      arr[arrI] = left[leftJ];
      leftJ++;
    } else {
      arr[arrI] = right[rightK];
      rightK++;
    }

    arrI++;
  }

  while (leftJ < left.length) {
    arr[arrI] = left[leftJ];
    leftJ++;
    arrI++;
  }

  while (rightK < right.length) {
    arr[arrI] = right[rightK];
    rightK++;
    arrI++;
  }

  return arr;
}
