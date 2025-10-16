import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Event khi người dùng yêu cầu đăng nhập
class RegisterEventEmailChanged extends RegisterEvent {
  final String email;

  RegisterEventEmailChanged(this.email);

  @override
  List<Object> get props => [email];
  @override
  String toString() => 'Email Changed : { email: $email }';
}

class RegisterEventPasswordChanged extends RegisterEvent {
  final String password;

  RegisterEventPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
  @override
  String toString() => 'Password Changed : { password: $password }';
}

class RegisterEventWithGoogle extends RegisterEvent {
  @override
  String toString() => 'Register With Google';
}

class RegisterEventWithEmailandPassword extends RegisterEvent {
  final String email;
  final String password;
  RegisterEventWithEmailandPassword(
      {required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
  @override
  String toString() => 'Register With Email and Password : { email: $email }';
}
