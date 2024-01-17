extension GroupBy<T> on Iterable<T> {
  Map<K, List<T>> groupBy<K>(
    K Function(T) key,
  ) {
    final Map<K, List<T>> groups = {};

    for (var i = 0; i < length; ++i) {
      final K k = key(elementAt(i));
      if (!groups.containsKey(k)) {
        groups[k] = [];
      }
      groups[k]?.add(elementAt(i));
    }

    return groups;
  }
}
