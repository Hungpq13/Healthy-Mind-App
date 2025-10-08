import 'package:flutter/material.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Lịch hẹn')),
      body: const Center(
        child: Text('Trang Lịch hẹn'),
      ),
    );
  }
}
