import 'package:todolist/infrastructure/api/client.dart';
import 'package:todolist/infrastructure/api/response.dart';
import 'package:todolist/infrastructure/api/validation_error_model.dart';
import 'package:todolist/infrastructure/api/validation_exception.dart';

class Request {
  final String uri = "register";
  final Client _sender;

  Request(this._sender);

  Future<Data> send(String token) async {
    try {
      var response = await _sender.post(uri, body.toMap());
      return new Data(response);
    } on ValidationException catch (e) {
      return new Future(
            () => new Data(
          Response.error(
            e.cause,
            new ValidationErrorModel(e.errorBags["errors"]),
            422,
          ),
        ),
      );
    }
  }
}
