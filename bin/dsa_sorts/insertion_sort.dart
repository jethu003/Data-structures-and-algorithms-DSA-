void main(List<String> args) {
  List<int> arr = [4, 1, 5, 7, 0, 7, 3, 2, 6, 8];
  for (int i = 1; i < arr.length; i++) {
    int current = arr[i];
    int j = i - 1;

    while (j >= 0 && arr[j] > current) {
      arr[j + 1] = arr[j];
      j--;
    }

     arr[j + 1] = current; 
  }
  print(arr);
}
