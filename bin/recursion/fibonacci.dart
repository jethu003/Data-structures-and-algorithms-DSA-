void main(List<String> args) {
  int n = 4;

 print( fibo(n));
}

int? fibo(int n) {
  if (n < 2) {
    return n;
  }

  return fibo(n - 1)! + fibo(n-2)!;
}
