import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cherich_care_2/pages/forget_password.dart';
import 'package:cherich_care_2/pages/home_page.dart';
import 'package:cherich_care_2/pages/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Global key for the form
  bool _isPasswordVisible = false; // State to toggle password visibility

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 60),
                const SizedBox(height: 16),
                const Text(
                  'WELCOME TO \nCHERISH CARE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 0, 85),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Log In With',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialLoginButton(
                      'Facebook',
                      Colors.black,
                      Image.asset('assets/images/fb.png', height: 20),
                      () async {
                        const url = 'https://www.facebook.com';
                        await _launchURL(url);
                      },
                    ),
                    const SizedBox(width: 16),
                    _socialLoginButton(
                      'Google',
                      Colors.black,
                      Image.asset('assets/images/google.png', height: 20),
                      () async {
                        const url = 'https://www.google.com';
                        await _launchURL(url);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'username',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: !_isPasswordVisible, // Toggle password visibility
                  decoration: InputDecoration(
                    hintText: 'password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible; // Toggle state
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
                    if (!specialCharRegex.hasMatch(value)) {
                      return "Password must include at least one special character";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.pink),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPassword(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    GestureDetector(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialLoginButton(String text, Color textColor, Widget icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
