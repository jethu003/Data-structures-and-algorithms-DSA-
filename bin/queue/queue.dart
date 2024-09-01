class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class Queue {
  Node? head;
  Node? rear;

  enqueue(int data) {
    var newNode = Node(data);
    if (head == null) {
      head = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

 
  int? dequeue() {
    if (head == null) {
      print('Queue is empty');
      return null;
    } else {
      int? data = head!.data;
      head = head?.next;
      if (head == null) {
        rear = null;
      }
      return data;
    }
  }
}
