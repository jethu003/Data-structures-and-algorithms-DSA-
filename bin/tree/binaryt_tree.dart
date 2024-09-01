class Node {
  int? data;
  Node? left, right;

  Node(this.data);
}

class BST {
  Node? root;

  insert(int data) {
    if (root == null) {
      root = Node(data);
    } else {
      insertAT(root, data);
    }
  }

  void insertAT(Node? node, int data) {
    var current = node;
    while (current != null) {
      if (data < current.data!) {
        if (current.left == null) {
          current.left = Node(data);
          break;
        } else {
          current = current.left;
        }
      } else {
        if (current.right == null) {
          current.right = Node(data);
          break;
        } else {
          current = current.right;
        }
      }
    }
  }

  bool contains(int data) {
    var current = root;

    while (current != null) {
      if (current.data == data) {
        return true;
      }

      if (data < current.data!) {
        if (current.data == data) {
          return true;
        } else {
          current = current.left;
        }
      } else {
        if (current.data == data) {
          return true;
        } else {
          current = current.right;
        }
      }
    }
    return false;
  }

  inorderTraversal(Node? node) {
    if (node != null) {
      inorderTraversal(node.left);
      print(node.data);
      inorderTraversal(node.right);
    }
  }

  deleteNode(int data) {
    root = deleteFunc(root, data);
  }

  Node? deleteFunc(Node? node, int data) {
    if (node == null) {
      return null;
    }

    if (data < node.data!) {
      node.left = deleteFunc(node.left, data);
    } else if (data > node.data!) {
      node.right = deleteFunc(node.right, data);
    } else {
      if (node.right == null && node.left == null) {
        return null;
      }
    }

    if (node.right == null) {
      return node.left;
    } else if (node.left == null) {
      return node.right;
    }
    return node;
  }
}

void main(List<String> args) {
  var bst = BST();
  bst.insert(20);
  bst.insert(21);
  bst.insert(22);
  bst.insert(23);
  bst.insert(24);
  bst.insert(25);

  // bst.inorderTraversal(bst.root);
  var s = bst.contains(22);
  print(s);
}
