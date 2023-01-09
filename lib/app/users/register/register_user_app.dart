import 'package:todolist/app/shared/entities/validation_error_model.dart';
import 'package:todolist/app/users/register/register_model.dart';
import 'package:todolist/app/users/register/request.dart';
import 'package:todolist/app/users/register/response.dart';
import 'package:todolist/infrastructure/api/validation_exception.dart';

class RegisterUserApp {
  final Request request;

  RegisterUserApp(this.request);

  Future<Response> register(
      String fullName, String email, String password, String confirm) async {
    try {
      return await this
          .request
          .send(new RegisterModel(fullName, email, password, confirm));
    } on ValidationException catch (e) {
      return new Future(
        () => Response.error(
          e.cause,
          new ValidationErrorModel(e.errorBags["errors"]),
          422,
        ),
      );
    }
  }
}
