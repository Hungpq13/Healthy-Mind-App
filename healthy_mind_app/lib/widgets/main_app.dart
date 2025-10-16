import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_app/auth/bloc/auth_bloc.dart';
import 'package:healthy_mind_app/auth/bloc/auth_event.dart';
import 'package:healthy_mind_app/auth/bloc/auth_state.dart';
import 'package:healthy_mind_app/auth/bloc/login/login_bloc.dart';
import 'package:healthy_mind_app/config/theme.dart';
import 'package:healthy_mind_app/repository/auth_repository.dart';
import 'package:healthy_mind_app/widgets/bottom_navigation/bottom_custom.dart';
import 'package:healthy_mind_app/widgets/login_view/login_widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository();

    return RepositoryProvider.value(
      value: authRepository,
      child: BlocProvider<AuthBloc>(
        create: (context) =>
            AuthBloc(authRepository: authRepository)..add(SignInRequested()),
        child: MaterialApp(
          theme: ThemeCustom.themeLight,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthBloc, AuthenticationState>(
            builder: (context, authState) {
              if (authState is AuthenticationStateSuccess) {
                return const BottomCustomNav();
              } else if (authState is AuthenticationStateFailure) {
                return BlocProvider<LoginBloc>(
                  create: (context) =>
                      LoginBloc(authRepository: authRepository),
                  child: const LoginWidget(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
