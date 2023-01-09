import 'package:todolist/app/shared/entities/validation_error_model.dart';
import 'package:todolist/domain/entities/user.dart';

class Response{
  final String message;
  final bool success;
  final Map<String, dynamic>? data ;
  final ValidationErrorModel? errors;
  final int code;

  Response(this.message, this.data, this.code): errors = null,success = true;

  Response.error(this.message, this.errors, this.code): data = null,success = false;

  Response convert(){
    if(this.data != null)
      this.data["user"] = User.fromJson(this.data["user"]);
    return this;
  }
}