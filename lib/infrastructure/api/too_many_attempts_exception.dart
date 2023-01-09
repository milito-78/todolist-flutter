class TooManyAttemptsException implements Exception{
  String cause;
  Map<String, dynamic> errorBags;

  TooManyAttemptsException(this.cause,this.errorBags);
}