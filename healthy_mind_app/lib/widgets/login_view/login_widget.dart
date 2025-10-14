import 'package:flutter/material.dart';
import 'package:healthy_mind_app/auth/bloc/auth_event.dart';
import 'package:healthy_mind_app/repository/auth_repository.dart';
import 'package:healthy_mind_app/utils/const.dart';
import 'package:healthy_mind_app/widgets/appbar_widget.dart';
import 'package:healthy_mind_app/widgets/login_view/register_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                obscureText: true,
                controller: _passwordController, // Gán controller
                decoration: const InputDecoration(
                  border: OutlineInputBorder(), // Thêm viền
                  labelText: 'Mật khẩu', // Nhãn
                  hintText: 'Nhập mật khẩu',
                  suffixIcon: Icon(Icons.visibility),
                  // Gợi ý
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
              AuthRepository authRepository = AuthRepository();
              authRepository.signIn(
                  email: _nameController.text,
                  password: _passwordController.text);
              // SignInRequested(_nameController.text, _passwordController.text);
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
