import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:healthy_mind_app/repository/auth_repository.dart';
import 'dart:async';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  StreamSubscription<User?>? _userSubscription;

  AuthBloc({required this.authRepository}) : super(const AuthState.unknown()) {
    // Lắng nghe sự thay đổi trạng thái user từ repository
    _userSubscription = authRepository.user.listen((user) {
      if (user != null) {
        emit(AuthState.authenticated(user));
      } else {
        emit(const AuthState.unauthenticated());
      }
    });

    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  Future<void> _onSignInRequested(
      SignInRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await authRepository.signIn(email: event.email, password: event.password);
      // Trạng thái sẽ tự động cập nhật bởi StreamSubscription
    } catch (e) {
      emit(AuthState.unauthenticated(error: e.toString()));
    }
  }

  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await authRepository.signUp(email: event.email, password: event.password);
      // Trạng thái sẽ tự động cập nhật bởi StreamSubscription
    } catch (e) {
      emit(AuthState.unauthenticated(error: e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
      SignOutRequested event, Emitter<AuthState> emit) async {
    await authRepository.signOut();
    // Trạng thái sẽ tự động cập nhật bởi StreamSubscription
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
