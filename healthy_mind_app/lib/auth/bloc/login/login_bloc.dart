// ignore_for_file: unused_element

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_app/auth/bloc/login/authLogin_state.dart';
import 'package:healthy_mind_app/auth/bloc/login/login_event.dart';
import 'package:healthy_mind_app/validators/validators.dart';
import 'package:healthy_mind_app/repository/auth_repository.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({
    required this.authRepository,
  }) : super(LoginState.intitial()) {
    EventTransformer<T> debounce<T>(Duration duration) {
      return (events, mapper) =>
          events.debounceTime(duration).asyncExpand(mapper);
    }

    // Lắng nghe sự thay đổi trạng thái user từ repository
    @override
    Stream<LoginState> mapEventToState(LoginEvent event) async* {
      final loginState = state;
      if (event is LoginEventEmailChanged) {
        yield loginState.cloneAndUpdate(
            isValidEmail: Validators.isValidEmail(event.email),
            email: event.email,
            password: '');
      } else if (event is LoginEventPasswordChanged) {
        yield loginState.cloneAndUpdate(
            password: event.password,
            isValidPassword: Validators.isValidPassword(event.password),
            email: '');
      } else if (event is LoginEventWithGoogle) {
        yield LoginState.loading();
        try {
          await authRepository.signInwithGoogle();
          yield LoginState.success();
          // Trạng thái sẽ tự động cập nhật bởi StreamSubscription
        } catch (e) {
          yield LoginState.failure();
        }
      } else if (event is LoginEventWithEmailandPassword) {
        yield LoginState.loading();
        try {
          await authRepository.signUp(
              email: event.email, password: event.password);
          yield LoginState.success();
          // Trạng thái sẽ tự động cập nhật bởi StreamSubscription
        } catch (e) {
          yield LoginState.failure();
        }
      }
    }
  }
}
