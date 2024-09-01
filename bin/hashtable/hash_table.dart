class HashTable<K, V> {
  int? size;
  late List<List<MapEntry<K, V>>> bucket;

  HashTable(this.size) : bucket = List.generate(size!, (_) => []);

  int hash(dynamic key) {
    return key.hashCode % size!;
  }

  addData(K key, V value) {
    var index = hash(key);
    List<MapEntry<K, V>> buckets = bucket[index];
    for (int i = 0; i < buckets.length; i++) {
      if (buckets[i].key == key) {
        buckets[i] = MapEntry(key, value);
      }
    }
    buckets.add(MapEntry(key, value));
  }

  List<MapEntry<K, V>> display() {
    List<MapEntry<K, V>> entries = [];
    for (List<MapEntry<K, V>> buckets in bucket) {
      entries.addAll(buckets);
    }
    return entries;
  }

  V? get(K key) {
    int idex = hash(key);
    List<MapEntry<K, V>> buckets = bucket[idex];
    for (var entry in buckets) {
      if (entry.key == key) {
        return entry.value;
      }
    }
    return null;
  }

    bool removeData(K key) {
    int index = hash(key);
    List<MapEntry<K, V>> buckets = bucket[index];
    for (int i = 0; i < buckets.length; i++) {
      if (buckets[i].key == key) {
        buckets.removeAt(i);
        return true;
      }
    }
    return false;
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

  // print(hashtable.display());

  print(hashtable.get('kiren'));

  // print(hashtable.display());


}
