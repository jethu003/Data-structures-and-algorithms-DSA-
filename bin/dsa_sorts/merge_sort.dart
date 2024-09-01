List<String> mergeSort(List<String> arr) {
  if (arr.length <= 1) {
    return arr;
  }

  int mid = arr.length ~/ 2;

  List<String> left = mergeSort(arr.sublist(0, mid));

  List<String> right = mergeSort(arr.sublist(mid));

  return merge(left, right);
}

List<String> merge(List left, List right) {
  List<String> result = [];

  int j = 0;
  int i = 0;
 while (i < left.length && j < right.length) {
    if (left[i].compareTo(right[j]) < 0) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  result.addAll(left.sublist(i) as Iterable<String>);
  result.addAll(right.sublist(j) as Iterable<String>);
  return result;
}

void main(List<String> args) {
  List<String> arr = ['jithu', 'ashin', 'kiren', 'razal'];

  print(mergeSort(arr));
}
