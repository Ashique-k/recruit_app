import 'package:flutter/material.dart';
import 'preference_page.dart';

class ProfessionalDetailsPage extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String address;
  final String dob;
  final String nationality;

  final linkedinController = TextEditingController();
  final resumeController = TextEditingController();
  final roleController = TextEditingController();
  final industryController = TextEditingController();
  final minSalaryController = TextEditingController();
  final maxSalaryController = TextEditingController();

  ProfessionalDetailsPage({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.dob,
    required this.nationality,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tell us about your professional background",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              buildTextField("LinkedIn Profile", linkedinController,
                  icon: Icons.link),
              buildTextField("Resume/CV Link", resumeController,
                  icon: Icons.file_copy),
              buildTextField("Desired Role", roleController,
                  icon: Icons.work_outline),
              buildTextField("Preferred Industry", industryController,
                  icon: Icons.domain),
              buildSalaryRangeFields(),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.teal,
                  ),
                  onPressed: () {
                    // Navigate to Preferences Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PreferencesPage(
                          name: name,
                          phone: phone,
                          email: email,
                          address: address,
                          dob: dob,
                          nationality: nationality,
                          linkedin: linkedinController.text,
                          resume: resumeController.text,
                          role: roleController.text,
                          industry: industryController.text,
                          salary:
                          "${minSalaryController.text} - ${maxSalaryController.text}",
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label,
      TextEditingController controller, {
        IconData? icon,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: Colors.teal) : null,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget buildSalaryRangeFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Salary Expectations",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: minSalaryController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Minimum Salary",
                    prefixText: "₹ ",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: maxSalaryController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Maximum Salary",
                    prefixText: "₹ ",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
