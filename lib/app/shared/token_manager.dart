import 'package:get_storage/get_storage.dart';
import 'package:todolist/domain/shared/tokenable.dart';

mixin TokenManager {
  Future<bool> saveToken(Tokenable token) async {
    final box = GetStorage();
    await box.write(TokenManagerKey.TOKEN.toString(), token.serialize());
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(TokenManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(TokenManagerKey.TOKEN.toString());
  }
}

enum TokenManagerKey { TOKEN }