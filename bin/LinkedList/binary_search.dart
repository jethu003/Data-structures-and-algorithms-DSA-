binarySearch(List arr, int target) {
  if (arr.length <= 1) {
    return arr;
  }
  int min = 0;
  int max = arr.length - 1;
  while (min < max) {
    int mid = (min + max) ~/ 2;

    if (arr[mid] == target) {
      return arr[mid];
    } else if (arr[mid] < target) {
      min = mid + 1;
    } else {
      max = mid - 1;
    }
  }
}

void main(List<String> args) {
  List arr = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
  ];

  int target = 8;

  var s = binarySearch(arr, target);
  print(s);
}
