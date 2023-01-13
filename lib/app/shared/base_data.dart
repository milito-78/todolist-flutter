import 'package:todolist/infrastructure/api/validation_error_model.dart';
import 'package:todolist/infrastructure/api/response.dart';


class BaseData{
  final Response _response;
  BaseData(this._response);

  String message(){
    return _response.message;
  }

  Map<String,dynamic>? get data{
    return _response.data;
  }

  int get code{
    return _response.code;
  }

  ValidationErrorModel? get errors{
    return _response.errors;
  }

  Response get response{
    return _response;
  }

  bool isSuccess() {
    return code >= 200 && code < 300;
  }
}