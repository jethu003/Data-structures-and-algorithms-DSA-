class HashTable<K, V> {
  int? size;
  late List<List<MapEntry<K, V>>> buckets;

  HashTable(this.size) : buckets = List.generate(size!, (_) => []);

  int? hash(K key) {
    return key.hashCode % size!;
  }

  addData(K key, V value) {
    int? index = hash(key);

    List<MapEntry<K, V>> bucket = buckets[index!];

    for (int i = 0; i < bucket.length; i++) {
      if (bucket[i].key == key) {
        bucket[i] = MapEntry(key, value);
      }
    }

    bucket.add(MapEntry(key, value));
  }

  List<MapEntry<K, V>> getAll() {
    List<MapEntry<K, V>> entries = [];
    for (var bucket in buckets) {
      entries.addAll(bucket);
    }
    return entries;
  }

  remove(K key) {
    int? index = hash(key);

    List<MapEntry<K, V>> bucket = buckets[index!];

    for (int i = 0; i < bucket.length; i++) {
      if (bucket[i].key == key) {
        bucket.removeAt(i);
        return;
      }
    }
  }

  
}

void main(List<String> args) {
  var hashtable = HashTable(32);
  hashtable.addData('jsdhj', 'amal');
  hashtable.addData('ashin', 'ama');
  hashtable.addData('kiren', 'mal');
  hashtable.addData('kiren', 'jjal');
  hashtable.addData('razal', 'aal');
  hashtable.addData('jithu', 'ashi');

  var s = hashtable.getAll();
  print(s);
}
