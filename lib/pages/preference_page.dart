import 'package:flutter/material.dart';
import 'additional_info.dart';

class PreferencesPage extends StatelessWidget {
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

  final locationController = TextEditingController();
  final availabilityController = TextEditingController();
  final employmentTypeController = TextEditingController();
  final payRangeController = TextEditingController();
  final workPreferencesController = TextEditingController();

  PreferencesPage({
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
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tell us about your professional background",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              buildDropdownField("Desired Work Location(s)", locationController, ["Onsite", "Remote", "Hybrid"]),
              buildDropdownField("Availability", availabilityController, ["Full-Time", "Part-Time", "Freelance"]),
              buildDropdownField("Preferred Employment Type", employmentTypeController, ["Permanent", "Contract", "Internship"]),
              buildSalaryRangeField(),
              buildDropdownField("Work Preferences", workPreferencesController, ["Flexible Hours", "9-5", "Shift Work"]),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Additional Information Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdditionalInfoPage(
                        name: name,
                        phone: phone,
                        email: email,
                        address: address,
                        dob: dob,
                        nationality: nationality,
                        linkedin: linkedin,
                        resume: resume,
                        role: role,
                        industry: industry,
                        salary: salary,
                        location: locationController.text,
                        availability: availabilityController.text,
                        employmentType: employmentTypeController.text,
                        payRange: payRangeController.text,
                        workPreferences: workPreferencesController.text,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,

                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField(String label, TextEditingController controller, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: DropdownButtonFormField<String>(

        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.teal),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.teal, width: 2.0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        hint: Text("Select $label"),
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          controller.text = newValue!;
        },
      ),
    );
  }

  Widget buildSalaryRangeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: payRangeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Pay Range (Min)",
                prefixText: "₹ ",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: payRangeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Pay Range (Max)",
                prefixText: "₹ ",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
