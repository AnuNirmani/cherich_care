import 'package:flutter/material.dart';

class Rf7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Being Overweight",
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
                  'assets/images/rf7.png', // Replace with your image asset path
                  width: 150, // Adjust width as needed
                  height: 150, // Adjust height as needed
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16), // Add spacing below the image

              // Main content text
              const Text(
                "\n Risk increases for breast cancer as you age. Unless you have found the fountain of everlasting youth, it's important to keep abreast of your health throughout your life. The statistic of 1-in-8 women getting diagnosed with breast cancer in their lifetime can be explained this way:\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const Text(
                "Imagine you are in a room with 8 women all of whom are over the age of 70. Statistically speaking, one of those 8 women would have had breast cancer at some point in her life. That is what is meant by lifetime risk for breast cancer. Now, if you went next door to a room full of women who were all aged 30, statistically speaking, you would need 204 women in that room before one of them would have had breast cancer. This is because risk is less for younger women than older women.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
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
