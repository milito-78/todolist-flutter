import 'package:todolist/infrastructure/api/validation_error_model.dart';

class Response{
  final String message;
  final bool success;
  final Map<String, dynamic>? data;
  final ValidationErrorModel? errors;
  final int code;

  Response(this.message, this.data, this.code): errors = null,success = true;

  Response.error(this.message, this.errors, this.code): data = null,success = false;
}