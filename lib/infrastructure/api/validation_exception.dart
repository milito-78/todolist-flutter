class ValidationException implements Exception{
  String cause = "Validation Exception";
  Map<String,dynamic> errorBags;

  ValidationException(this.errorBags);
}