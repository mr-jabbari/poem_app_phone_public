import 'package:flutter/material.dart';
import '../widgets/try_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.teal.shade300],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'خوش آمدید',
                  style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(
                    label: 'ثبت نام',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/signup");
                    },
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    label: 'ورود به اکانت',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                  // ),
                  // SizedBox(height: 16),
                  // CustomButton(
                  //   label: 'رفتن به صفحه اصلی',
                  //   backgroundColor: Colors.white,
                  //   foregroundColor: Colors.teal,
                  //   onPressed: () {
                  //     Navigator.pushReplacementNamed(context, "/main_screen");
                  //   },
                  ),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onPressed;

  CustomButton({
    required this.label,
    this.backgroundColor = const Color(0xFF69C2B0),
    this.foregroundColor = Colors.white,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: backgroundColor),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          label,
          style: TextStyle(color: foregroundColor, fontSize: 18),
        ),
      ),
    );
  }
}
