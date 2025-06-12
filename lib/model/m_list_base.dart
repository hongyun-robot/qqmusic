abstract class MListBase {
  T getField<T>(String fieldName) {
    var map = toJson();
    if (map.containsKey(fieldName)) {
      return map[fieldName];
    }
    throw ArgumentError('Field not found: $fieldName');
  }

  Map<String, dynamic> toJson();
}
