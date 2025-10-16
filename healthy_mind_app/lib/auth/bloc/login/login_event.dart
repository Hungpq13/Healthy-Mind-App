import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Event khi người dùng yêu cầu đăng nhập
class LoginEventEmailChanged extends LoginEvent {
  final String email;

  LoginEventEmailChanged(this.email);

  @override
  List<Object> get props => [email];
  @override
  String toString() => 'Email Changed : { email: $email }';
}

class LoginEventPasswordChanged extends LoginEvent {
  final String password;

  LoginEventPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
  @override
  String toString() => 'Password Changed : { password: $password }';
}

class LoginEventWithGoogle extends LoginEvent {
  @override
  String toString() => 'Login With Google';
}

class LoginEventWithEmailandPassword extends LoginEvent {
  final String email;
  final String password;
  LoginEventWithEmailandPassword({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
  @override
  String toString() => 'Login With Email and Password : { email: $email }';
}
