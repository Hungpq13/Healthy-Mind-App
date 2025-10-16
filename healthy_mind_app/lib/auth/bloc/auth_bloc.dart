import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:healthy_mind_app/repository/auth_repository.dart';
import 'dart:async';

class AuthBloc extends Bloc<AuthEvent, AuthenticationState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthenticationInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  Future<void> _onSignInRequested(
      SignInRequested event, Emitter<AuthenticationState> emitter) async {
    final isSignIn = await AuthRepository().isSignedin();
    if (isSignIn) {
      final user = await AuthRepository().getUser();
      emitter(AuthenticationStateSuccess(user!));
    } else {
      emitter(const AuthenticationStateFailure("User not signed in"));
    }
  }

  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<AuthenticationState> emitter) async {
    final isSignIn = await AuthRepository().isSignedin();
    if (isSignIn) {
      final user = await AuthRepository().getUser();
      emitter(AuthenticationStateSuccess(user!));
    } else {
      emitter(const AuthenticationStateFailure("User not signed in"));
    }
  }

  Future<void> _onSignOutRequested(
      SignOutRequested event, Emitter<AuthenticationState> emitter) async {
    await authRepository.signOut();
    emitter(const AuthenticationStateFailure("User signed out"));
  }
}
