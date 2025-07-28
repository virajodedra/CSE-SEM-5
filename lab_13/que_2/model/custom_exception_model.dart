class InvalidAgeException implements Exception {
  String message;
  InvalidAgeException(this.message);
  
  @override
  String toString() => "InvalidAgeException: $message";
}
