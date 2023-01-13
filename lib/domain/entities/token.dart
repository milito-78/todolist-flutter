import 'dart:convert';

import 'package:todolist/domain/shared/model.dart';
import 'package:todolist/domain/shared/tokenable.dart';

class Token extends Model implements Tokenable{
  final String token;
  final int expireAfter;
  final String type;

  Token(this.token, this.expireAfter, this.type):super(null,null);

  factory Token.fromJson(Map<String, dynamic> json){
    return new Token(
      json["token"],
      json["expire_after"],
      json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'type': type,
    'expire_after': expireAfter,
  };

  @override
  String serialize() => jsonEncode(toJson());
}