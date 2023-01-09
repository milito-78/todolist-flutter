import 'dart:convert';
import 'package:todolist/Infrastructure/api/client.dart';
import 'package:todolist/app/users/register/register_model.dart';
import 'package:todolist/app/users/register/response.dart';
import 'package:http/http.dart' as http;

class Request extends Client {
  final String uri = "register";

  Request(String mainUrl) : super(mainUrl);

  Future<Response> send(RegisterModel body) async {
    var url = Uri.https(this.mainUrl, this.uri);
    var response = await http.post(url, body: body.toMap());
    if (super.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      super.handleErrors(response);
    }
  }
}
