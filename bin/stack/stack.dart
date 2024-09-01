class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class Stack {
  Node? head;

  push(int data) {
    var newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  int? pop() {
    int? data;

    if (head != null) {
      data = head!.data;
      head = head?.next;
    }
    return data;
  }

  int? peek() {
    if (head != null) {
      return head!.data;
    }
    return null;
  }

  void sort() {
    var sortedStack = Stack();

    while (head != null) {
      int temp = pop()!;

      while (sortedStack.head != null && sortedStack.peek()! > temp) {
        push(sortedStack.pop()!);
      }

      sortedStack.push(temp);
    }

    // Transfer sorted elements back to the original stack
    while (sortedStack.head != null) {
      push(sortedStack.pop()!);
    }
  }

  display() {
    var current = head;
    while (current != null) {
      print(current.data);
      current.data;

      current = current.next;
    }
  }
}

void main(List<String> args) {
  var stak = Stack();
  stak.push(5);
  stak.push(9);
  stak.push(8);
  stak.push(6);
  stak.push(7);

  stak.sort();
  stak.display();
}
