import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
