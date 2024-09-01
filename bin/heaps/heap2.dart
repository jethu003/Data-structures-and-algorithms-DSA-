class MaxHeap {
  List<int> heap = [];

  int get size => heap.length;

  // Get parent index
  int _parentIndex(int index) => (index - 1) ~/ 2;

  // Get left child index
  int _leftChildIndex(int index) => 2 * index + 1;

  // Get right child index
  int _rightChildIndex(int index) => 2 * index + 2;

  // Insert a new element into the heap
  void insert(int value) {
    heap.add(value);
    _heapifyUp(size - 1);
  }

  // Heapify up to maintain the max-heap property after insertion
  void _heapifyUp(int index) {
    while (index > 0 && heap[_parentIndex(index)] < heap[index]) {
      _swap(_parentIndex(index), index);
      index = _parentIndex(index);
    }
  }

  // Extract the maximum element (root) from the heap
  int extractMax() {
    if (size == 0) throw Exception("Heap is empty");

    int max = heap[0];
    heap[0] = heap[size - 1];
    heap.removeLast();
    _heapifyDown(0);

    return max;
  }

  // Heapify down to maintain the max-heap property after extraction
  void _heapifyDown(int index) {
    int leftChild = _leftChildIndex(index);
    int rightChild = _rightChildIndex(index);
    int largest = index;

    if (leftChild < size && heap[leftChild] > heap[largest]) {
      largest = leftChild;
    }

    if (rightChild < size && heap[rightChild] > heap[largest]) {
      largest = rightChild;
    }

    if (largest != index) {
      _swap(index, largest);
      _heapifyDown(largest);
    }
  }

  // Swap two elements in the heap
  void _swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  // Peek the maximum element without removing it
  int peek() {
    if (size == 0) throw Exception("Heap is empty");
    return heap[0];
  }
}

void main() {
  MaxHeap heap = MaxHeap();
  
  heap.insert(10);
  heap.insert(20);
  heap.insert(15);
  heap.insert(30);
  heap.insert(40);

  print("Max Element: ${heap.extractMax()}"); // 40
  print("Max Element: ${heap.peek()}");       // 30
}
