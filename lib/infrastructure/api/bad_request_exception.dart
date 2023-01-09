class BadRequestException implements Exception{
  String cause;
  Map<String, dynamic> errorBags;

  BadRequestException(this.cause,this.errorBags);
}