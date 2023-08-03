import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserData {
  final String current_user_name;
  final String current_user_username;
  final String current_user_phone_email;
  final String current_user_id;

  UserData({
    required this.current_user_id,
    required this.current_user_name,
    required this.current_user_phone_email,
    required this.current_user_username,
  });
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<UserData> user_datas = [];

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://shahbeyt.iran.liara.run/api/my_information'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        user_datas = jsonData
            .map((data) => UserData(
                  current_user_id: data["id"],
                  current_user_name: data["name"],
                  current_user_phone_email: data["phone_email"],
                  current_user_username: data["username"],
                ))
            .toList();
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> refreshData() async {
    await fetchData();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshData,
      child: Scaffold(
        backgroundColor: const Color(0xFFECF0F1),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "پروفایل",
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
                backgroundColor: Color(0xFF949047),
                radius: 50,
                backgroundImage: AssetImage('assets/icons/king.png')),
            const SizedBox(height: 20),
            Text(
              user_datas.isNotEmpty ? user_datas[0].current_user_name : 'سلطان مگوایر',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004054)),
            ),
            const SizedBox(height: 10),
            Text(
              user_datas.isNotEmpty ? user_datas[0].current_user_name : "DeltaMaguirepositive@united.com",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "درباره من",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004054)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "بهترین مدافع تاریخ انگلیس",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "علایق",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004054)),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: [
                      Chip(label: Text("Technology")),
                      Chip(label: Text("Travel")),
                      Chip(label: Text("Photography")),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal, // sets background color
                    onPrimary: Colors.white, // sets text color
                    fixedSize: const Size(120, 50),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/bookmarked_screen");
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.bookmark,
                        color: Color(0xFFC5BE6A),
                      ),
                      Text("نشان شده ها"),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal, // sets background color
                    onPrimary: Colors.white,
                    fixedSize: const Size(120, 50), // sets text color
                  ),
                  onPressed: () {
                    // TODO: Handle account info button press
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.account_circle,
                        color: Color(0xFFC5BE6A),
                      ),
                      Text("اطلاعات اکانت"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal, // sets background color
                    onPrimary: Colors.white,
                    fixedSize: const Size(120, 50), // sets text color
                  ),
                  onPressed: () {
                    // TODO: Handle bookmarks button press
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.settings,
                        color: Color(0xFFC5BE6A),
                      ),
                      Text("تنظیمات"),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal, // sets background color
                    onPrimary: Colors.white,
                    fixedSize: const Size(120, 50), // sets text color
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/liked_screen");
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.favorite,
                        color: Color(0xFFC5BE6A),
                      ),
                      Text("لایک شده ها"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal, // sets background color
                    onPrimary: Colors.white,
                    fixedSize: const Size(120, 50), // sets text color
                  ),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('isLoggedIn', false);
                    Navigator.pushReplacementNamed(context, "/welcome_screen");
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Color(0xFFC5BE6A),
                      ),
                      Text("خروج از اکانت"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
