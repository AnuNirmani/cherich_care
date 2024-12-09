import 'package:flutter/material.dart';

class Sym2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Thick Area",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // Set background color for the whole page
      backgroundColor: Colors.pink[50],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image at the top
              Center(
                child: Image.asset(
                  'assets/images/sym1.png', // Replace with your image asset path
                  width: 200, // Adjust width as needed
                  height: 200, // Adjust height as needed
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16), // Add spacing below the image

              // Main content text
              const Text(
                "\n The most common sign of breast cancer is a lump, deep in the breast. It often feels hard, like a lemon seed, and usually immovable. It can be any shape or size. A lump is not always easy to feel. If you have access to breast cancer screening use it-a mammogram can detect a lump long before it can be felt.\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const Text(
                "\nMost lumps turn out to be harmless.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const Text(
                "Such as a fluid filled cyst or a fibroadenoma.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
