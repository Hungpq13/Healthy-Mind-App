import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Event khi người dùng yêu cầu đăng nhập
class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

// Event khi người dùng yêu cầu đăng ký
class SignUpRequested extends AuthEvent {
  final String email;
  final String password;

  SignUpRequested(this.email, this.password);
}

// Event khi người dùng yêu cầu đăng xuất
class SignOutRequested extends AuthEvent {}
