import 'package:flutter/material.dart';
import '../profilePage/profile.dart';
import '../settingPage/setting.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageList = [
    ProfilePage(title: "Profile"),
    SettingPage(title: "Settings"),
  ];
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        backgroundColor: Colors.red,
      ),
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.accessible_forward), label: "accessible_forward"),
        BottomNavigationBarItem(icon: Icon(Icons.access_time_filled_sharp), label:"access_time_filled_sharp"),
      ]),
      drawer: Container(
        height: double.infinity,
        width: 240,
        color: Colors.white,
      ),
    );

  }
}
