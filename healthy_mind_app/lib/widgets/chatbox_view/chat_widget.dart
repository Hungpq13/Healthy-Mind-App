import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Tin nhắn')),
      body: const Center(
        child: Text('Trang Tin nhắn'),
      ),
    );
  }
}
