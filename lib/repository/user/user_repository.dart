import 'package:todolist/data/remote/network_service.dart';
import 'package:todolist/domain/entities/user.dart';
import 'package:todolist/infrastructure/api/client.dart';
import 'package:todolist/infrastructure/api/remote_api_endpoint.dart';
import 'package:todolist/infrastructure/api/response.dart';
import 'package:todolist/repository/user/i_user_repository.dart';

class UserRepository implements IUserRepository{
  Client _sender = new NetworkService(RemoteApiEndpoint().path);
  @override
  Future<User?> save(Map<String, dynamic> data) async {
    try {
      Response response = await _sender.post("user/register",data);
      final jsonData = User.fromJson(response.data!);
      return jsonData;
    } catch (e) {
      throw e;
    }
  }
}