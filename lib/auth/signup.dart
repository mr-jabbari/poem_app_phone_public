import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/snack_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String user_name;
  late String phone_email;
  late String password;
  late String name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool passwordVisible = false;

  Future<void> registerUser() async {
    final String apiUrl = 'https://shahbeyt.iran.liara.run/api/register';
    final Map<String, dynamic> requestData = {
      'name': _nameController.text,
      'username': _usernameController.text,
      'phoneEmail': _phoneEmailController.text,
      'password': _passwordController.text,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['success']) {
        // Registration successful
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        Navigator.pushReplacementNamed(context, "/main_screen");
      } else {
        // Registration failed
        final String errorMessage = responseData['message'];
        print('Registration failed: $errorMessage');
      }
    } else {
      // Request failed
      print('Request failed with status code ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xffffffff), Color(0x8f14ffe9)],
            stops: [0.6, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                reverse: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, "/welcome_screen");
                                  },
                                  icon: const Icon(
                                    Icons.home_rounded,
                                    size: 40,
                                    color: Colors.teal,
                                  )),
                              const Text(
                                "ثبت نام",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "نام کاربری لازم میباشد";
                              }
                              return null;
                            },
                            controller: _usernameController,
                            decoration: InputDecoration(
                                labelText: 'نام کاربری',
                                hintText:
                                    'نام کاربری خود را وارد کنید(با حروف انگلیسی)',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.tealAccent, width: 1),
                                    borderRadius: BorderRadius.circular(25)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.teal, width: 2),
                                    borderRadius: BorderRadius.circular(25))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "نام لازم میباشد";
                              }
                              return null;
                            },
                            controller: _nameController,
                            decoration: InputDecoration(
                                labelText: 'نام',
                                hintText: 'نام خود را وارد کنید',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.tealAccent, width: 1),
                                    borderRadius: BorderRadius.circular(25)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.teal, width: 2),
                                    borderRadius: BorderRadius.circular(25))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ایمیل یا تلفن همراه ضروری میباشد";
                              } else if (value.isValidEmail() == false) {
                                return "invalid email";
                              } else if (value.isValidEmail() == true) {
                                return null;
                              }
                              return null;
                            },
                            controller: _phoneEmailController,
                            decoration: InputDecoration(
                                labelText: 'ایمیل یا شماره همراه',
                                hintText:
                                    'ایمیل یا شماره همراه خود را وارد کنید',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.tealAccent, width: 1),
                                    borderRadius: BorderRadius.circular(25)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.teal, width: 2),
                                    borderRadius: BorderRadius.circular(25))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "رمز لازم میباشد";
                              }
                              return null;
                            },
                            controller: _passwordController,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.teal,
                                ),
                              ),
                              labelText: 'رمز',
                              hintText: 'رمز خود را وارد کنید',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.tealAccent, width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.teal, width: 2),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "/login");
                              },
                              child: const Text(
                                'ورود به اکانت',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Text(
                              "اکانت دارم؟ ",
                              style: TextStyle(
                                  fontSize: 16, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Material(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(25),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  registerUser();
                                } else {
                                  MyMassageHandler.showSnackBar(_scaffoldKey,
                                      "لطفا تمام گزینه ها را پر کنید");
                                }
                              },
                              child: const Text(
                                "ثبت نام",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^[a-zA-Z0-9]+[\-\_\.a-zA-Z0-9]*[a-zA-Z0-9]*[@][a-zA-Z0-9]{2,}[\.][a-zA-Z]{2,3}$')
        .hasMatch(this);
  }
}
