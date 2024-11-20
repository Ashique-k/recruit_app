import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:recruitment_app/pages/proffesional_detail_page.dart';

class ProfileCreationPage extends StatefulWidget {
  @override
  _ProfileCreationPageState createState() => _ProfileCreationPageState();
}

class _ProfileCreationPageState extends State<ProfileCreationPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for fields
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final dobController = TextEditingController();

  // Nationality list
  final List<String> nationalities = [
    'Select your nationality',
    'American',
    'British',
    'Canadian',
    'Indian',
    'Australian',
    'German',
    'French',
    'Chinese',
    'Japanese',
    'Other'
  ];
  String selectedNationality = 'Select your nationality';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fill in your details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "We need these details to create your profile.",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),
                buildTextField(
                  "Full Name",
                  nameController,
                  icon: Icons.person,
                ),
                buildTextField(
                  "Phone",
                  phoneController,
                  isNumeric: true,
                  icon: Icons.phone,
                ),
                buildTextField(
                  "Email",
                  emailController,
                  isEmail: true,
                  icon: Icons.email,
                ),
                buildTextField(
                  "Address",
                  addressController,
                  icon: Icons.home,
                ),
                buildDateField(
                  "Date of Birth",
                  dobController,
                  icon: Icons.calendar_today,
                ),
                buildDropdownField(
                  "Nationality",
                  icon: Icons.flag,
                ),
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
                      if (_formKey.currentState!.validate() &&
                          selectedNationality != 'Select your nationality') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfessionalDetailsPage(
                              name: nameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                              address: addressController.text,
                              dob: dobController.text,
                              nationality: selectedNationality,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select your nationality.'),
                          ),
                        );
                      }
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
      ),
    );
  }

  Widget buildTextField(
      String label,
      TextEditingController controller, {
        bool isNumeric = false,
        bool isEmail = false,
        IconData? icon,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumeric
            ? TextInputType.number
            : (isEmail ? TextInputType.emailAddress : TextInputType.text),
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          if (isEmail && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
      ),
    );
  }

  Widget buildDateField(String label, TextEditingController controller,
      {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        readOnly: true,
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
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }

  Widget buildDropdownField(String label, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButtonFormField<String>(
        value: selectedNationality,
        items: nationalities
            .map(
              (nationality) => DropdownMenuItem(
            value: nationality,
            child: Text(nationality),
          ),
        )
            .toList(),
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
        onChanged: (value) {
          setState(() {
            selectedNationality = value!;
          });
        },
        validator: (value) {
          if (value == 'Select your nationality') {
            return 'Please select your nationality';
          }
          return null;
        },
      ),
    );
  }
}
