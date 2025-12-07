extension MyIterable<T> on Iterable<T> {
  T? get firstElement => isNotEmpty ? first : null;
  T? get lastElement => isNotEmpty ? last : null;

  T? find(bool Function(T) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }

  T? call(int? index) {
    if (index == null || isEmpty || index < 0 || index >= length) return null;

    return elementAt(index);
  }
}
