class CommonUtil {
  static bool isEmpty(obj) {
    if (obj is String) return obj.isEmpty;
    if (obj is List) return obj.isEmpty || obj.length == 0;
    return obj == null;
  }
}