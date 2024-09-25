// Time complexity: 𝑂(n log n)
// Space complexity: 𝑂(1)
// Stability: No
// Recusion: Yes
// In-place: Yes
// DC: No

bool worthyCallHeapify(int index, int listLength) {
  return listLength > 2 * index + 2 || listLength > 2 * index + 1;
}

void heapsort(List<int> list) {
  int n = list.length;

  // Build max-heap
  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(list, n, i);
  }

  // Extract elements one by one from the heap
  for (int i = n - 1; i > 0; i--) {
    // Move current root to the end
    swap(list, 0, i);

    // Call heapify on the reduced heap
    // Test if greater than one prevents
    // unecessary call that will not run.
    if (i > 1) heapify(list, i, 0);
  }
}

// To heapify a subtree rooted with node i which is an index in list[]
void heapify(List<int> list, int n, int i) {
  int largest = i; // Initialize largest as root
  int left = 2 * i + 1; // left child
  int right = 2 * i + 2; // right child

  if (left < n && list[left] > list[largest]) {
    largest = left;
  }

  if (right < n && list[right] > list[largest]) {
    largest = right;
  }

  // If largest is not root
  if (largest != i) {
    swap(list, i, largest);

    // It prevents an unecessary recursive call
    if (worthyCallHeapify(n, largest)) heapify(list, n, largest);
  }
}

void swap(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
