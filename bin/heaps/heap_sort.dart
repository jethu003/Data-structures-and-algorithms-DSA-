void heapSort(List<int> array) {
  int n = array.length;

  // Build a max heap
  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(array, n, i);
  }

  // Extract elements one by one from the heap
  for (int i = n - 1; i > 0; i--) {
    // Move current root to the end
    int temp = array[0];
    array[0] = array[i];
    array[i] = temp;

    // Call heapify on the reduced heap
    heapify(array, i, 0);
  }
}

// To maintain the heap property
void heapify(List<int> array, int n, int i) {
  int largest = i; // Initialize largest as root
  int left = 2 * i + 1; // left = 2*i + 1
  int right = 2 * i + 2; // right = 2*i + 2

  // If left child is larger than root
  if (left < n && array[left] > array[largest]) {
    largest = left;
  }

  // If right child is larger than largest so far
  if (right < n && array[right] > array[largest]) {
    largest = right;
  }

  // If largest is not root
  if (largest != i) {
    int swap = array[i];
    array[i] = array[largest];
    array[largest] = swap;

    // Recursively heapify the affected subtree
    heapify(array, n, largest);
  }
}

void main() {
  List<int> array = [12, 11, 13, 5, 6, 7];
  print('Original array: $array');
  
  heapSort(array);
  
  print('Sorted array: $array');
}
