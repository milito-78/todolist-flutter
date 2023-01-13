import 'dart:convert';

import 'package:get/get.dart';
import 'package:todolist/app/shared/token_manager.dart';
import 'package:todolist/domain/entities/token.dart';

class CheckUserLoginApp extends GetxController with TokenManager {
  final Request request;
  RegisterUserApp(this.request);

  Future<bool> execute() async {
    var token = handleTokenFromManager();
    if(token == null)
      return false;

    return token;
  }

  Token? handleTokenFromManager(){
    var serializedToken = getToken();
    if(serializedToken != null){
      try {
        return Token.fromJson(jsonDecode(serializedToken));
      }catch(e){
        //TODO log
        return null;
      }
    }
    return null;
  }
}