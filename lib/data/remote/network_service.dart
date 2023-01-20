import 'package:todolist/infrastructure/api/client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:todolist/infrastructure/api/response.dart';

class NetworkService extends Client{
  NetworkService(String mainUrl) : super(mainUrl);

  Future post(String uri,[Map<String, dynamic> body = const {},Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri);
    var response = await http.post(url, headers: headers, body: body);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }

  Future get(String uri,[Map<String, dynamic> queryParams = const {},Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri, queryParams);
    var response = await http.get(url, headers: headers);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }

  Future put(String uri,Map<String, dynamic> body,[Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri);
    var response = await http.put(url, headers: headers, body: body);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }

  Future patch(String uri,Map<String, dynamic> body,[Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri);
    var response = await http.patch(url, headers: headers, body: body);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }

  Future delete(String uri, [Map<String, dynamic> body = const {},Map<String, String> headers = const {}]) async {
    var url = Uri.https(this.mainUrl, uri);
    var response = await http.delete(url, headers: headers, body: body);
    if (this.isSuccess(response.statusCode)) {
      var temp = jsonDecode(response.body);
      return new Response(temp["message"], temp["data"], response.statusCode);
    } else {
      this.handleErrors(response);
    }
  }

  Future option(String uri,[Map<String, dynamic> queryParams = const {},Map<String, String> headers = const {}]) async {
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