import 'package:flutter/material.dart';
import '../profilePage/profile.dart';
import '../settingPage/setting.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          'Welcome to the Main Page!',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red.shade50,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ⚙️ Settings button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingPage(title: 'Settings'),
                    ),
                  );
                },
                icon: const Icon(Icons.settings),
                label: const Text('Settings'),
              ),

              // 👤 Profile button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(title: 'Profile'),
                    ),
                  );
                },
                icon: const Icon(Icons.person),
                label: const Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
