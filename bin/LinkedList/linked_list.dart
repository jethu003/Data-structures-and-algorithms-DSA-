class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class LinkeedList {
  Node? head;

  append(int data) {
    var newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      var current = head;

      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  display() {
    var current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  reverseLinkedLIst() {
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

  addDataAfterTarget(int data, int target) {
    var current = head;
    while (current != null) {
      var newNode = Node(data);
      if (current.data == target) {
        newNode.next = current.next;
        current.next = newNode;
        return;
      }
      current = current.next;
    }
  }

  addDataToEnd(int data) {
    var current = head;

    while (current!.next != null) {
      var newNode = Node(data);
      current = current.next;
      if (current!.next == null) {
        current.next = newNode;
        return;
      }
    }
    current = current.next;
  }

  addDataToBegining(int data) {
    var newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

 void delete(int data) {
  // Check if the head node contains the data to be deleted
  if (head?.data == data) {
    head = head?.next;
    return;
  }
  // Traverse the list to find the node before the one to be deleted
  var current = head;
  while (current?.next != null) {
    if (current?.next?.data == data) {
      current?.next = current.next?.next;
      return; // Exit the loop after deleting the node
    }
    current = current?.next;
  }
}

}

void main(List<String> args) {
  var linkedList = LinkeedList();
  linkedList.append(21);
  linkedList.append(22);
  linkedList.append(23);

  // linkedList.reverseLinkedLIst();
  // linkedList.addDataAfterTarget(24, 21);
  // linkedList.addDataToEnd(12);
  linkedList.delete(23);
  linkedList.display();
}
