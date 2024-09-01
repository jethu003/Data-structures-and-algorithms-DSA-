List<String> quickSort(List<String> arr) {
  if (arr.length <= 1) {
    return arr;
  }

  String pivot = arr[arr.length ~/ 2];

  List<String> left = [];

  List<String> equal = [];

  List<String> right = [];

  for (var element in arr) {
    if (element.compareTo(pivot) < 0) {
      left.add(element);
    } else if (element.compareTo(pivot) == 0) {
      equal.add(element);
    } else {
      right.add(element);
    }
  }

  return [...quickSort(left), ...equal, ...quickSort(right)];
}

void main(List<String> args) {
  List<String> arr = ['jithu', 'ashin', 'kiren', 'razal'];

  print(quickSort(arr));
}
