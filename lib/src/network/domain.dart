class Domain {
  static Domain? _internal;
  factory Domain() {
    _internal ??= Domain._();

    return _internal!;
  }

  Domain._();
}
