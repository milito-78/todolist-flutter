import 'package:todolist/app/shared/auth_header.dart';
import 'package:todolist/app/users/profile/data.dart';
import 'package:todolist/infrastructure/api/auth_exception.dart';
import 'package:todolist/infrastructure/api/client.dart';
import 'package:todolist/infrastructure/api/response.dart';

class Request with AuthHeader{
  final String uri = "profile";
  final Client _sender;

  Request(this._sender);

  Future<Data> send(String token) async {
    try {
      var response = await _sender.get(uri, {},authorization(token));
      return new Data(response);
    } on AuthException catch (e) {
      return new Future(
            () => new Data(
          Response.error(
            e.cause,
            null,
            401,
          ),
        ),
      );
    }
  }
}
