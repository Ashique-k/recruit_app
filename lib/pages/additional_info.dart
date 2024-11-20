import 'package:flutter/material.dart';

import 'home_page.dart';

class AdditionalInfoPage extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String address;
  final String dob;
  final String nationality;
  final String linkedin;
  final String resume;
  final String role;
  final String industry;
  final String salary;
  final String location;
  final String availability;
  final String employmentType;
  final String payRange;
  final String workPreferences;

  final socialMediaController = TextEditingController();
  final medicalConditionController = TextEditingController();
  final medicalHistoryController = TextEditingController();
  final bankruptcyController = TextEditingController();
  final convictionsController = TextEditingController();

  AdditionalInfoPage({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.dob,
    required this.nationality,
    required this.linkedin,
    required this.resume,
    required this.role,
    required this.industry,
    required this.salary,
    required this.location,
    required this.availability,
    required this.employmentType,
    required this.payRange,
    required this.workPreferences,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Information'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            buildSectionHeader("Professional Details"),
            buildTextField("Social Media / Portfolio Links", socialMediaController, Icons.link),
            const SizedBox(height: 16),
            buildSectionHeader("Medical Information"),
            buildTextField("Current Medical Conditions", medicalConditionController, Icons.medical_services),
            buildTextField("Medical History", medicalHistoryController, Icons.history),
            const SizedBox(height: 16),
            buildSectionHeader("Legal Information"),
            buildTextField("Bankruptcy Issues", bankruptcyController, Icons.account_balance),
            buildTextField("Convictions by Law", convictionsController, Icons.gavel),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the home page without saving additional information
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false, // Clear all previous routes
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300, // Background color
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Submit additional information and navigate to home page
                    print("Submitted profile with the following details:");
                    print("Name: $name, Phone: $phone, Email: $email");
                    print("Social Media: ${socialMediaController.text}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile submitted successfully!')),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  HomeScreen()),
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Background color
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  child: const Text("Submit"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.teal),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
