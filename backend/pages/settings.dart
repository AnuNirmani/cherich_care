import 'package:cherich_care_2/pages/contry.dart';
import 'package:cherich_care_2/pages/languages.dart';
import 'package:cherich_care_2/pages/profile.dart';
import 'package:cherich_care_2/pages/theam_color.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Toggle states
  bool isDoubleMastectomyEnabled = true;
  bool isPeriodTrackerEnabled = true;

  Color _saveButtonColor = Colors.pinkAccent; // Default color

  void _changeSaveButtonColor() {
    setState(() {
      _saveButtonColor = Colors.pinkAccent; // Change to desired color, e.g., green
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          'Settings',
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
      backgroundColor: Colors.pink[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildSettingOption(
              context,
              title: 'Language',
              value: 'English',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Languages()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildSettingOption(
              context,
              title: 'Country',
              value: 'Sri Lanka',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Contry()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildSettingOption(
              context,
              title: 'Change theme color',
              value: '',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TheamColor()),
                );
              },
            ),
            const SizedBox(height: 20),

            // Toggle for Double Mastectomy
            _buildToggleOption(
              context,
              title: 'Double Mastectomy',
              value: isDoubleMastectomyEnabled,
              onChanged: (newValue) {
                setState(() {
                  isDoubleMastectomyEnabled = newValue;
                });
                print('Double Mastectomy is now ${newValue ? 'Enabled' : 'Disabled'}');
              },
            ),
            const SizedBox(height: 20),

            // Toggle for Period Tracker
            _buildToggleOption(
              context,
              title: 'Period Tracker',
              value: isPeriodTrackerEnabled,
              onChanged: (newValue) {
                setState(() {
                  isPeriodTrackerEnabled = newValue;
                });
                print('Period Tracker is now ${newValue ? 'Enabled' : 'Disabled'}');
              },
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: 130,
                height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _changeSaveButtonColor(); // Change button color on press
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Profile()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _saveButtonColor, // Use dynamic color
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption(BuildContext context,
      {required String title, required String value, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Color.fromARGB(255, 0, 0, 0)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleOption(BuildContext context,
      {required String title, required bool value, required ValueChanged<bool> onChanged}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Switch(
            value: value,
            activeColor: Colors.pinkAccent,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
