// ignore_for_file: unused_element

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_app/auth/bloc/register/authRegister_state.dart';
import 'package:healthy_mind_app/auth/bloc/register/register_event.dart';
import 'package:healthy_mind_app/validators/validators.dart';
import 'package:healthy_mind_app/repository/auth_repository.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository})
      : super(RegisterState.intitial()) {
    // ignore: duplicate_ignore
    // ignore: unused_element
    EventTransformer<T> debounce<T>(Duration duration) {
      return (events, mapper) =>
          events.debounceTime(duration).asyncExpand(mapper);
    }

    // Lắng nghe sự thay đổi trạng thái user từ repository
    @override
    Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
      final registerState = state;
      if (event is RegisterEventEmailChanged) {
        yield registerState.cloneAndUpdate(
            isValidEmail: Validators.isValidEmail(event.email),
            email: event.email,
            password: '');
      } else if (event is RegisterEventPasswordChanged) {
        yield registerState.cloneAndUpdate(
            password: event.password,
            isValidPassword: Validators.isValidPassword(event.password),
            email: '');
      } else if (event is RegisterEventWithGoogle) {
        yield RegisterState.loading();
        try {
          await authRepository.signInwithGoogle();
          yield RegisterState.success();
          // Trạng thái sẽ tự động cập nhật bởi StreamSubscription
        } catch (e) {
          yield RegisterState.failure();
        }
      } else if (event is RegisterEventWithEmailandPassword) {
        yield RegisterState.loading();
        try {
          await authRepository.signUp(
              email: event.email, password: event.password);
          yield RegisterState.success();
          // Trạng thái sẽ tự động cập nhật bởi StreamSubscription
        } catch (e) {
          yield RegisterState.failure();
        }
      }
    }
  }
}
