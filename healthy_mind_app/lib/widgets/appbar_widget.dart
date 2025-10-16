import 'package:flutter/material.dart';

class AppbarHMWidget extends StatelessWidget {
  const AppbarHMWidget({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1, // Thêm đường viền mỏng bên dưới cho đẹp hơn

      // Dùng `leading` cho icon bên trái
      leading: IconButton(
        color: Colors.black54,
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          // Dùng Navigator.pop(context) để quay lại màn hình trước
          Navigator.of(context).pop();
        },
      ),

      // Đặt Text trực tiếp vào title
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18, // Tăng size một chút cho dễ nhìn
            fontWeight: FontWeight.w500,
            color: Colors.black87),
      ),

      // Để căn lề trái cho title, hãy đặt centerTitle = false
    );
  }
}
