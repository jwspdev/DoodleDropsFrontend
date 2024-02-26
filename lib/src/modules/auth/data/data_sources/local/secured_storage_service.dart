import 'package:doodle_drops/src/modules/auth/data/data_sources/local/local_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/auth_token.dart';

class SecuredStorageService implements LocalStorageService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Future<void> deleteToken(String key) async {
    await storage.delete(key: key);
  }

  @override
  Future<AuthToken?> readToken(String key) async {
    final token = await storage.read(key: key);
    return token != null ? AuthToken(token) : null;
  }

  @override
  Future<void> writeToken(String key, AuthToken token) async {
    await storage.write(key: key, value: token.token);
  }
}
