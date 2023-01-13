import 'package:todolist/domain/shared/model.dart';

class User extends Model{
  final int id;
  final String fullName;
  final String email;

  User(this.id, this.fullName, this.email, String? createdAt,String? updatedAt) : super(createdAt, updatedAt);

  factory  User.fromJson(Map<String, dynamic> json){
    return new User(
      json["id"],
      json["full_name"],
      json["email"],
      json["createdAt"],
      json["updatedAt"],
    );
  }
}