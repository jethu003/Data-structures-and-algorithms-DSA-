class Queue {
  List<int> arr = [];

  
  void enQueue(int data) {
    arr.add(data);
  }

  
  int? deQueue() {
    if (isEmpty()) {
      print('Queue is empty');
      return null;
    } else {
      return arr.removeAt(0);
    }
  }


  int? peek() {
    if (isEmpty()) {
      print('Queue is empty');
      return null;
    } else {
      return arr.first;
    }
  }

  
  bool isEmpty() {
    return arr.isEmpty;
  }

 
  int size() {
    return arr.length;
  }

 
  void display() {
    if (isEmpty()) {
      print('Queue is empty');
    } else {
      print('Queue: ${arr.join(', ')}');
    }
  }
}

void main() {
  var queue = Queue();
  queue.enQueue(10);
  queue.enQueue(20);
  queue.enQueue(30);

  queue.display(); 

  print('Dequeued: ${queue.deQueue()}'); 
  queue.display(); 

  print('Front: ${queue.peek()}'); 
  print('Size: ${queue.size()}'); 

  queue.deQueue();
  queue.deQueue();
  queue.deQueue(); 
}
