// Define the Graph class
class Graph {
  // Use a Map to represent the adjacency list
  Map<String, List<String>> adjacencyList = {};

  // Function to add a vertex to the graph
  void addVertex(String vertex) {
    adjacencyList[vertex] = [];
  }

  // Function to add an edge between two vertices
  void addEdge(String vertex1, String vertex2) {
    // Since it's an undirected graph, add each vertex to the other's list
    adjacencyList[vertex1]?.add(vertex2);
    adjacencyList[vertex2]?.add(vertex1);
  }

  // Function to print the graph
  void printGraph() {
    adjacencyList.forEach((vertex, edges) {
      print('$vertex $edges');
    });
  }

  // Function for Depth-First Search (DFS)
  void dfs(String startVertex, Set<String> visited) {
    if (visited.contains(startVertex)) return;

    print(startVertex);
    visited.add(startVertex);

    for (var neighbor in adjacencyList[startVertex] ?? []) {
      dfs(neighbor, visited);
    }
  }

  // Function for Breadth-First Search (BFS)
  void bfs(String startVertex) {
    Set<String> visited = {};
    List<String> queue = [];

    visited.add(startVertex);
    queue.add(startVertex);

    while (queue.isNotEmpty) {
      String currentVertex = queue.removeAt(0);
      print(currentVertex);

      for (var neighbor in adjacencyList[currentVertex] ?? []) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      }
    }
  }
}

// Example usage
void main() {
  // Create a graph instance
  var graph = Graph();

  // Add vertices
  graph.addVertex('A');
  graph.addVertex('B');
  graph.addVertex('C');
  graph.addVertex('D');
  graph.addVertex('E');

  // Add edges
  graph.addEdge('A', 'B');
  graph.addEdge('A', 'C');
  graph.addEdge('B', 'D');
  graph.addEdge('C', 'E');
  graph.addEdge('D', 'E');

  // Print the graph
  print('Graph:');
  graph.printGraph();

  // Perform DFS
  print('\nDFS starting from A:');
  graph.dfs('A', {});

  // Perform BFS
  print('\nBFS starting from A:');
  graph.bfs('A');
}
