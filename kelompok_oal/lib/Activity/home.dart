import 'package:flutter/material.dart';
import 'package:kelompok_oal/Activity/chat.dart';
import 'package:kelompok_oal/Activity/home2.dart';
import 'package:kelompok_oal/Activity/notif.dart';
import 'package:kelompok_oal/provider/bottonN.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Widget> _body = [MyHome2(), Mynotif(), Mychat()];

  @override
  Widget build(BuildContext context) {
    var prov7 = Provider.of<BottonNavigation>(context);
    PageController _pageController = PageController(initialPage: prov7.bnIndex);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: prov7.bnIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_sharp), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Message'),
        ],
        onTap: (value) {
          prov7.bnIdex = value;
          _pageController.animateToPage(value,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
      body: PageView(
        children: _body,
        controller: _pageController,
        onPageChanged: (value) {
          prov7.bnIdex = value;
        },
      ),
    );
  }
}
