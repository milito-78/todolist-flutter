import 'package:todolist/app/shared/base_data.dart';
import 'package:todolist/domain/entities/token.dart';
import 'package:todolist/domain/entities/user.dart';

class Data extends BaseData{
  late final User user;

  Data(response) : super(response){
    _convert();
  }

  void _convert(){
    if(super.data != null) {
      user = User.fromJson(super.data!["user"]);
    }
  }
}