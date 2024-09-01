void main(List<String> args) {
  add(0);
}

add(int n) {
  if (n == 5) {
    print(5);
    return;
  }
  
  add(n + 1);
  print(n);
  
}
