import 'package:cherich_care_2/main.dart';
import 'package:cherich_care_2/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false; // For password field
  bool _isConfirmPasswordVisible = false; // For confirm password field

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
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Create Your Account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 50),
                    // Username TextField
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "User Name*",
                        border: OutlineInputBorder(),
                        hintText: "Enter your username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your username";
                        }
                        /*if (value.length < 3) {
                          return "Username must be at least 3 characters long";
                        }*/
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Email TextField
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "E-mail*",
                        border: OutlineInputBorder(),
                        hintText: "Enter your email",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Password TextField
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Password*",
                        border: const OutlineInputBorder(),
                        hintText: "Password must be at least 6 characters long",
                        suffix: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }
                          if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                            return null;
                        },
                      ),
                    const SizedBox(height: 16),
                    // Confirm Password TextField
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Confirm Password*",
                        border: const OutlineInputBorder(),
                        hintText: "Re-enter your password",
                        suffix: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }
                          if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                            return null;
                        },
                      ),

                    const SizedBox(height: 25),
                    // Sign Up Button
                    Center(
                      child: SizedBox(
                        width: 130,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, navigate to the SignIn screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  SignIn()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // OR Divider
                    const Text(
                      "or",
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    // Social Media Buttons
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
                    const SizedBox(height: 30),
                    // Log In Text
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ),
                        );
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.black54),
                          children: [
                            TextSpan(
                              text: "Log In",
                              style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
