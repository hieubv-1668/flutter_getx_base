class Pair<T1, T2> {
  const Pair(this._first, this._second);

  final T1 _first;

  final T2 _second;

  T1 first() => _first;

  T2 second() => _second;
}
