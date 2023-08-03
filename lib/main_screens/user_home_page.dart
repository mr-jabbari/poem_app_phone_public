import 'package:flutter/material.dart';
import 'package:poem_app_phone/main_screens/home.dart';
import 'package:poem_app_phone/main_screens/search.dart';
import 'package:poem_app_phone/main_screens/user_profile.dart';

import '../widgets/MyCostumeIcon.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = const [
    HomeScreen(),
    SearchPage(),
    // Center(child: Text('room')),
    Center(child: Text('sound')),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 25,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: Colors.teal,
        currentIndex: _selectedIndex,
        items: const [
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'خانه',
          // ),
          BottomNavigationBarItem(
            icon: MyCoustomeIcons(
              iconName: "home_y",
              color: 0xFFC5BE6A,
              size: 22,
            ),
            label: 'خانه',
            // backgroundColor: Color(0xFFC5BE6A)
          ),

          BottomNavigationBarItem(
            icon: MyCoustomeIcons(
              iconName: "search_y",
              color: 0xFFC5BE6A,
              size: 22,
            ),
            label: 'جستجو',
          ),
          // BottomNavigationBarItem(S
          //   icon: Icon(Icons.mic),
          //   label: 'اتاق',
          // ),
          BottomNavigationBarItem(
            icon: MyCoustomeIcons(
              iconName: "audio_y",
              color: 0xFFC5BE6A,
              size: 22,
            ),
            label: 'صدا',
          ),
          BottomNavigationBarItem(
            icon: MyCoustomeIcons(
              iconName: "profile_y",
              color: 0xFFC5BE6A,
              size: 22,
            ),
            label: 'پروفایل',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
