import 'package:cherich_care_2/main.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart'; // Ensure this is the correct path for your SignUp page

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "\nTo customize Cherish Care according to your body, we need to ask a few questions from you",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: "First Name*",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your first name";
                    }
                    if (value.length < 2) {
                      return "First name must be at least 2 characters long";
                    }
                    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return "First name can only contain alphabets and spaces";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Country you live",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: ["Country 1", "Country 2", "Country 3"]
                      .map((country) => DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                _buildRadioGroup("What sex were you assigned at birth?", ["Boy", "Girl"]),
                const SizedBox(height: 20),
                _buildRadioGroup("Have you had both breasts removed?", ["Yes", "No"]),
                const SizedBox(height: 20),
                _buildRadioGroup("Have you entered menopause yet?", ["Yes", "No"]),
                const SizedBox(height: 20),
                _buildRadioGroup("Do you menstruate?", ["Yes", "No"]),
                const SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: "Back to ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: 130,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Let's Start",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadioGroup(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Row(
          children: options
              .map(
                (option) => Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: option,
                        groupValue: null,
                        onChanged: (value) {
                          // Handle radio button selection
                        },
                      ),
                      Text(option),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
