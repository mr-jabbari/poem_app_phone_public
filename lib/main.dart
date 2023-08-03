import 'package:flutter/material.dart';
import 'package:poem_app_phone/add_data/add_beyt.dart';
import 'package:poem_app_phone/auth/login.dart';
import 'package:poem_app_phone/auth/signup.dart';
import 'package:poem_app_phone/main_screens/bookmarked.dart';
import 'package:poem_app_phone/main_screens/liked.dart';
import 'package:poem_app_phone/main_screens/welcome_screen.dart';
import 'main_screens/user_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String initialRoute = isLoggedIn ? '/main_screen' : '/welcome_screen';

    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        routes: {
          "/main_screen": (context) => const UserHomePage(),
          "/welcome_screen": (context) => const WelcomeScreen(),
          "/signup": (context) => const Register(),
          "/login": (context) => const Login(),
          "/beyt_data": (context) => BeytDataPage(),
          "/liked_screen": (context) => const LikedScreen(),
          "/bookmarked_screen": (context) => const BookmarkedScreen(),
        },
      ),
    );
  }
}