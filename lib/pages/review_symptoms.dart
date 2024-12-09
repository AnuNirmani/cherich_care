import 'package:cherich_care_2/pages/save_symptoms.dart';
import 'package:flutter/material.dart';


class ReviewSymptoms extends StatefulWidget {
  const ReviewSymptoms({Key? key}) : super(key: key);

  @override
  State<ReviewSymptoms> createState() => _ReviewSymptoms();
}

class _ReviewSymptoms extends State<ReviewSymptoms> {
  final Map<String, String> selectedSide = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          'Cherry Analysis',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildSymptomRow('Hard lump'),
                  _buildSymptomRow('Thick area'),
                  _buildSymptomRow('Dimple'),
                  _buildSymptomRow('Nipple crust'),
                  _buildSymptomRow('Red or hot'),
                  _buildSymptomRow('New fluid'),
                  _buildSymptomRow('Skin sores'),
                  _buildSymptomRow('Bump'),
                  _buildSymptomRow('Growing vein'),
                  _buildSymptomRow('Sunken nipple'),
                  _buildSymptomRow('New shape or new size'),
                  _buildSymptomRow('“Orange peel” skin'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // Save action
                  print(selectedSide);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Analysis saved successfully!'),
                    ),
                  );

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SaveSymptoms(),
                      ),
                  );

                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildSymptomRow(String symptom) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              symptom,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          const SizedBox(width: 20),
          Row(
            children: [
              Radio<String>(
                value: 'Left',
                groupValue: selectedSide[symptom],
                onChanged: (value) {
                  setState(() {
                    selectedSide[symptom] = value!;
                  });
                },
              ),
              const Text('Left'),
            ],
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              Radio<String>(
                value: 'Right',
                groupValue: selectedSide[symptom],
                onChanged: (value) {
                  setState(() {
                    selectedSide[symptom] = value!;
                  });
                },
              ),
              const Text('Right'),
            ],
          ),
        ],
      ),
    );
  }
}
