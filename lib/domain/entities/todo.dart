import 'package:todolist/domain/shared/model.dart';

class Todo extends Model{
  final int id;
  final String title;
  final String? description;
  final String? imagePath;
  final String? deadline;

  Todo(this.id, this.title, this.description, this.imagePath, this.deadline,String? createdAt,String? updatedAt) : super(createdAt, updatedAt);

  factory Todo.fromJson(Map<String, dynamic> json){
    return new Todo(
      json["id"],
      json["title"],
      json["description"],
      json["image_path"],
      json["deadline"],
      json["createdAt"],
      json["updatedAt"],
    );
  }
}