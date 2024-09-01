class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  TrieNode root = TrieNode();

  // Insert a word into the Trie
  void insert(String word) {
    TrieNode node = root;
    for (int i = 0; i  < word.length; i++) {
      String char = word[i];
      if (!node.children.containsKey(char)) {
        node.children[char] = TrieNode();
      }
      node = node.children[char]!;
    }
    node.isEndOfWord = true;
  }

  // Search for a word in the Trie
  bool search(String word) {
    TrieNode? node = _searchNode(word);
    return node != null && node.isEndOfWord;
  }

  // Check if there is any word in the Trie that starts with the given prefix
  bool startsWith(String prefix) {
    TrieNode? node = _searchNode(prefix);
    return node != null;
  }

  // Delete a word from the Trie
  bool delete(String word) {
    return _delete(root, word, 0);
  }

  TrieNode? _searchNode(String prefix) {
    TrieNode node = root;
    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];
      if (!node.children.containsKey(char)) {
        return null;
      }
      node = node.children[char]!;
    }
    return node;
  }

  bool _delete(TrieNode node, String word, int depth) {
    if (depth == word.length) {
      if (!node.isEndOfWord) {
        return false;
      }
      node.isEndOfWord = false;
      return node.children.isEmpty;
    }

    String char = word[depth];
    TrieNode? childNode = node.children[char];
    if (childNode == null) {
      return false;
    }

    bool shouldDeleteChild = _delete(childNode, word, depth + 1);

    if (shouldDeleteChild) {
      node.children.remove(char);
      return node.children.isEmpty && !node.isEndOfWord;
    }
    return false;
  }
}

void main() {
  Trie trie = Trie();

  trie.insert("hello");
  trie.insert("helium");

  print(trie.search("hello")); // true
  print(trie.search("helium")); // true
  print(trie.search("hell")); // false
  print(trie.startsWith("hell")); // true
  print(trie.startsWith("heaven")); // false

  trie.delete("helium");
  print(trie.search("helium")); // false
  print(trie.startsWith("helium")); // false
  print(trie.search("hello")); // true
}