int binarySearch(List arr, int min, int max, int target) {
  if (min > max) {
    return -1;
  }

  int mid = (min + max) ~/ 2;
  if (arr[mid] == target) {
    return mid;
  }

  if (arr[mid] < target) {
    return binarySearch(arr, mid + 1, max, target);
  } else {
    return binarySearch(arr, min, mid - 1, target);
  }
}

void main(List<String> args) {
  List arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int min = 0;
  int max = arr.length - 1;
  int target = 1;
  var s = binarySearch(arr, min, max, target);
  print(s);
}
