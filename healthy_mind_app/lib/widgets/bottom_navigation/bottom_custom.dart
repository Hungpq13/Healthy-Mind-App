import 'package:flutter/material.dart';
import 'package:healthy_mind_app/config/theme.dart';
import 'package:healthy_mind_app/widgets/account_information_view/information_user_widget.dart';
import 'package:healthy_mind_app/widgets/chatbox_view/chat_widget.dart';
import 'package:healthy_mind_app/widgets/home_view/homewidget.dart';
import 'package:healthy_mind_app/widgets/schedule_view/schedule_widget.dart';

class BottomCustomNav extends StatefulWidget {
  const BottomCustomNav({super.key});

  @override
  State<BottomCustomNav> createState() => _BottomCustomNavState();
}

class _BottomCustomNavState extends State<BottomCustomNav> {
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
    BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month_outlined), label: ' Lịch hẹn'),
    BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Tin nhắn'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
  ];

  final List<Widget> pages = const [
    HomeWidget(),
    ScheduleWidget(),
    ChatWidget(),
    InformationUserWidget(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white24,
          currentIndex: currentIndex,
          elevation: 0,
          selectedItemColor: CustomColors.purple,
          unselectedItemColor: Colors.black54,
          items: items,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
