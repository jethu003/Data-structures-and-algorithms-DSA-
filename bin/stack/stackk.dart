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
      // print(head?.data);
      head = head?.next;
    }
    return data;
  }

  int? peek() {
    int? data;

    if (head != null) {
      data = head!.data;
    }
    return data;
  }

  sort() {
    var tempStack = Stack();

    while (head != null) {
      int? data = pop();

      while (tempStack.head != null && tempStack.peek()! > data!) {
        push(tempStack.pop()!);
      }

      tempStack.push(data!);
    }

    while (tempStack.head != null) {
      push(tempStack.pop()!);
    }
  }

  display() {
    Node? prev;
    Node? next;

    var current = head;

    while (current != null) {
      next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    head = prev;
  }

  displ() {
    var current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main(List<String> args) {
  var stak = Stack();
  stak.push(12);
  stak.push(152);
  stak.push(132);
  stak.push(122);

  // stak.sort();
  // stak.display();
  stak.displ();
}
