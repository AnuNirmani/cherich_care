import 'package:cherich_care_2/pages/quiz.dart';
import 'package:flutter/material.dart';


class InvestiTools extends StatelessWidget {
  const InvestiTools({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50], // Change background color
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Investigation Tools",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Tap Here To Have The Risk Assesment ",
                  style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),),
                  GestureDetector(
                    child: const Text(
                      'Quiz',
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Quiz(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }


}
