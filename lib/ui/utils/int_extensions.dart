extension IntExtensions on int {
  String get formattedTime {
    return this < 10 ? "0$this" : "$this";
  }
}
