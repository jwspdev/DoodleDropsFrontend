// import 'package:doodle_drops/src/modules/auth/data/data_sources/local/secured_storage_service.dart';
import 'package:doodle_drops/src/modules/auth/data/data_sources/local/secured_storage_service.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/auth_token.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/token_repository.dart';

class TokenRepositoryImplementation implements TokenRepository {
  final SecuredStorageService _securedStorageService;

  TokenRepositoryImplementation(this._securedStorageService);

  @override
  Future<void> deleteToken(String key) async {
    await _securedStorageService.deleteToken(key);
  }

  @override
  Future<AuthToken?> readToken(String key) async {
    return await _securedStorageService.readToken(key);
  }

  @override
  Future<void> writeToken(String key, AuthToken token) async {
    await _securedStorageService.writeToken(key, token);
  }
}
