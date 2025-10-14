import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // Stream để theo dõi trạng thái đăng nhập của user
  Stream<User?> get user => _firebaseAuth.authStateChanges();

  // Hàm đăng ký
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // Xử lý các lỗi cụ thể từ Firebase
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Hàm đăng nhập
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Tài khoản hoặc mật khẩu không khớp, vui lòng thử lại");
    }
  }

  // Hàm đăng xuất
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
