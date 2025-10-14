import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_app/auth/bloc/auth_bloc.dart';
import 'package:healthy_mind_app/auth/bloc/auth_state.dart';
import 'package:healthy_mind_app/config/theme.dart';
import 'package:healthy_mind_app/repository/auth_repository.dart';
import 'package:healthy_mind_app/widgets/bottom_navigation/bottom_custom.dart';
import 'package:healthy_mind_app/widgets/login_view/register_widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Cung cấp Repository cho toàn bộ ứng dụng
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        // Đọc repository và tạo AuthBloc
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          theme: ThemeCustom.themeLight,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.status == AuthStatus.authenticated) {
                return const BottomCustomNav();
              }
              // Mặc định và khi chưa xác thực thì vào trang Login
              return const RegisterWidget();
            },
          ),
        ),
      ),
    );
  }
}
