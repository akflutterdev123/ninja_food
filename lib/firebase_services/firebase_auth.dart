import 'package:ninjaa/utils/common_library.dart';

final authRepositoryProvider =
    Provider<AuthenticationRepository>((ref) => AuthenticationRepository());

class AuthenticationRepository {
  final db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
}
