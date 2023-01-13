import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todolist/infrastructure/api/auth_exception.dart';
import 'package:todolist/infrastructure/api/bad_request_exception.dart';
import 'package:todolist/infrastructure/api/not_found_exception.dart';
import 'package:todolist/infrastructure/api/response.dart';
import 'package:todolist/infrastructure/api/server_error_exception.dart';
import 'package:todolist/infrastructure/api/too_many_attempts_exception.dart';
import 'package:todolist/infrastructure/api/validation_exception.dart';

class Client{
  final String mainUrl;

  Client(this.mainUrl);

  bool isSuccess(int status) {
    return status >= 200 && status < 300;
  }

  void handleErrors(http.Response response){
    if(this.isNotFound(response.statusCode))
      this.notFound();
    if(this.isAuth(response.statusCode))
      this.authError();
    if(this.isBadRequest(response.statusCode))
      this.badRequest(jsonDecode(response.body));
    if(this.isValidationException(response.statusCode))
      this.validationError(jsonDecode(response.body));
    if(this.isTooManyAttempts(response.statusCode))
      this.tooManyAttempts(jsonDecode(response.body));
    this.serverError();
  }

  bool isNotFound(int status) => status == 404;

  bool isAuth(int status) =>  status == 401;

  bool isBadRequest(int status) => status == 400;

  bool isValidationException(int status) => status == 422;

  bool isTooManyAttempts(int status) => status == 429;

  void notFound() => throw new NotFoundException();

  void authError() => throw new AuthException("Un authenticate");

  void badRequest(Map<String, dynamic> bags) => throw new BadRequestException("Bad Exception",bags);

  void validationError(Map<String, dynamic> bags) => throw new ValidationException(bags);

  void tooManyAttempts(Map<String, dynamic> bags) => throw new TooManyAttemptsException(bags["message"],bags);

  void serverError() => throw new ServerErrorException();


  Future<Response> post(String uri,Map<String, dynamic> body,[Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri);
    var response = await http.post(url, headers: headers, body: body);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }

  Future<Response> get(String uri,[Map<String, dynamic> queryParams = const {},Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri, queryParams);
    var response = await http.get(url, headers: headers);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }

  Future<Response> put(String uri,Map<String, dynamic> body,[Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri);
    var response = await http.put(url, headers: headers, body: body);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }

  Future<Response> patch(String uri,Map<String, dynamic> body,[Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri);
    var response = await http.patch(url, headers: headers, body: body);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }

  Future<Response> delete(String uri, [Map<String, dynamic> body = const {},Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri);
    var response = await http.delete(url, headers: headers, body: body);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }

  Future<Response> option(String uri,[Map<String, dynamic> queryParams = const {},Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri, queryParams);
    var response = await http.head(url, headers: headers);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }
}