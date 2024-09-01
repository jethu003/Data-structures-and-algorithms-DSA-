class Node {
  int? data;
  Node? next;
  Node? prev;

  Node(this.data);
}

class LinkedList {
  Node? head;
  Node? tail;

  append(int data) {
    var newNode = Node(data);
    if (head == null) {
      head = tail = newNode;
    } else {
      tail?.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  display() {
    var current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void delete(int data) {
    var current = head;

    while (current != null) {
      if (current.data == data) {
        if (current == head) {
          head = head!.next;
          if (head != null) {
            head!.prev = null;
          } else {
            tail = null;
          }
          return;
        }

        if (current == tail) {
          tail = tail!.prev;
          if (tail != null) {
            tail!.next = null;
          } else {
            head = null;
          }
          return;
        }

        current.prev!.next = current.next;
        current.next!.prev = current.prev;
        return;
      }

      current = current.next;
    }
  }

    void addDataNext(int data, int target) {
    var current = head;
    var newNode = Node(data);
    while (current != null) {
      if (current.data == target) {
        newNode.next = current.next;
        newNode.prev = current;
        if (current.next != null) {
          current.next!.prev = newNode;
        } else {
          tail = newNode; // Update the tail if we're adding at the end
        }
        current.next = newNode;
        return; // Exit after inserting the node
      }
      current = current.next;
    }
  }
}

void main(List<String> args) {
  var linkedList = LinkedList();
  linkedList.append(21);
  linkedList.append(22);
  linkedList.append(23);

  // linkedList.reverseLinkedLIst();
  // linkedList.addDataAfterTarget(24, 21);
  // linkedList.addDataToEnd(12);
  // linkedList.delete(23);
  linkedList.addDataNext(24, 23);
  linkedList.display();
}
