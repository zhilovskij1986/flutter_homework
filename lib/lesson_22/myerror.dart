class CustomServerError implements Exception {
  final String message;
 
  CustomServerError(this.message);

  @override
  String toString() => 'CustomServerError: $message';
}