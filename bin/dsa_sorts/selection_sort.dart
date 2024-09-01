void main(List<String> args) {
  List<int> arr = [4, 1, 5, 7, 0, 7, 3, 2, 6, 8];

  for (int i = 0; i < arr.length; i++) {
    int min = i;

    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[min]) {
        min = j;
      }
    }
    var temp = arr[i];
    arr[i] = arr[min];
    arr[min] = temp;
  }

  print(arr);
}
