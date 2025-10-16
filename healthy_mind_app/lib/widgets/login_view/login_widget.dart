// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_app/repository/auth_repository.dart';
import 'package:healthy_mind_app/utils/const.dart';
import 'package:healthy_mind_app/widgets/appbar_widget.dart';
import 'package:healthy_mind_app/widgets/bottom_navigation/bottom_custom.dart';
import 'package:healthy_mind_app/widgets/login_view/register_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppbarHMWidget(title: "Đăng nhập"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Image.asset(
                AssetCustom.getLinkImage('logo'),
                fit: BoxFit.contain,
                width: size.width * 0.25,
                height: size.width * 0.25,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            decoration: BoxDecoration(
              color: Colors
                  .white, // Màu nền của Container (quan trọng để bóng hiện rõ)
              borderRadius:
                  BorderRadius.circular(8), // Bo góc cho Container và bóng
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.1), // Màu bóng, độ trong suốt 10%
                  spreadRadius: 2, // Độ lan rộng
                  blurRadius: 8, // Độ mờ
                  offset: const Offset(0, 4), // Dịch chuyển bóng xuống dưới 4px
                ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              decoration: BoxDecoration(
                color: Colors
                    .white, // Màu nền của Container (quan trọng để bóng hiện rõ)
                borderRadius:
                    BorderRadius.circular(8), // Bo góc cho Container và bóng
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), // Màu bóng, độ trong suốt 10%
                    spreadRadius: 2, // Độ lan rộng
                    blurRadius: 8, // Độ mờ
                    offset:
                        const Offset(0, 4), // Dịch chuyển bóng xuống dưới 4px
                  ),
                ],
              ),
              child: TextField(
                controller: _nameController, // Gán controller
                decoration: const InputDecoration(
                  border: OutlineInputBorder(), // Thêm viền
                  labelText: 'Tài khoản', // Nhãn
                  hintText: 'Nhập tài khoản', // Gợi ý
                ),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              decoration: BoxDecoration(
                color: Colors
                    .white, // Màu nền của Container (quan trọng để bóng hiện rõ)
                borderRadius:
                    BorderRadius.circular(8), // Bo góc cho Container và bóng
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), // Màu bóng, độ trong suốt 10%
                    spreadRadius: 2, // Độ lan rộng
                    blurRadius: 8, // Độ mờ
                    offset:
                        const Offset(0, 4), // Dịch chuyển bóng xuống dưới 4px
                  ),
                ],
              ),
              child: TextField(
                obscureText: _obscureText,
                controller: _passwordController, // Gán controller
                decoration: InputDecoration(
                  border: const OutlineInputBorder(), // Thêm viền
                  labelText: 'Mật khẩu', // Nhãn
                  hintText: 'Nhập mật khẩu',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: _obscureText == true
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.visibility_off)),
                ),
              )),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFFEBEBEB),
              minimumSize: Size(size.width * 0.9, 50),
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bo góc cho nút
              ),
            ),
            onPressed: () async {
              // Use the repository provided at app level so state and listeners are consistent
              final authRepository = context.read<AuthRepository>();

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) =>
                    const Center(child: CircularProgressIndicator()),
              );

              try {
                await authRepository.signIn(
                  email: _nameController.text.trim(),
                  password: _passwordController.text,
                );

                // close loading
                Navigator.of(context).pop();

                // navigate to Home (replace current route)
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const BottomCustomNav()),
                );
              } on Exception catch (e) {
                Navigator.of(context).pop(); // close loading
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Đăng nhập thất bại: ${e.toString()}')),
                );
              }

              //    const CircularProgressIndicator();
            },
            child: const Text(
              'Đăng nhập',
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Bạn chưa có tài khoản?'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterWidget()),
                  );
                },
                child: const Text(
                  'Đăng ký ngay!',
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(size.width * 0.8, 50),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bo góc cho nút
              ),
            ),
            onPressed: () async {
              // SignUpRequested(_nameController.text, _passwordController.text);
            },
            child: SizedBox(
              width: size.width * 0.8,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.facebook, color: Colors.blue),
                  Text(
                    'Facebook',
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(size.width * 0.8, 50),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bo góc cho nút
              ),
            ),
            onPressed: () async {
              // SignUpRequested(_nameController.text, _passwordController.text);
            },
            child: SizedBox(
              width: size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetCustom.getLinkImage('logo_gg'),
                    width: 20,
                  ),
                  const Text(
                    'Google',
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.08,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bằng cách tiếp tục, bạn đã đồng ý với các '),
              Text('Điều khoản,', style: TextStyle(color: Colors.lightBlue)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Điều kiện sử dụng',
                  style: TextStyle(color: Colors.lightBlue)),
              Text(' của chúng tôi'),
            ],
          ),
        ],
      ),
    );
  }
}
