import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

class AuthState extends Equatable {
  final AuthStatus status;
  final User? user;
  final bool isLoading;
  final String? error;

  const AuthState._({
    required this.status,
    this.user,
    this.isLoading = false,
    this.error,
  });

  // Trạng thái ban đầu
  const AuthState.unknown() : this._(status: AuthStatus.unknown);

  // Trạng thái đã xác thực
  const AuthState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  // Trạng thái chưa xác thực
  const AuthState.unauthenticated({String? error})
      : this._(status: AuthStatus.unauthenticated, error: error);

  // Trạng thái đang xử lý
  const AuthState.loading()
      : this._(status: AuthStatus.unauthenticated, isLoading: true);

  @override
  List<Object?> get props => [status, user, isLoading, error];
}
