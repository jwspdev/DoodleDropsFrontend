import 'package:doodle_drops/src/modules/auth/data/models/responses/auth_token.dart';

abstract class TokenRepository {
  Future<void> writeToken(String key, AuthToken token);
  Future<AuthToken?> readToken(String key);
  Future<void> deleteToken(String key);
}
