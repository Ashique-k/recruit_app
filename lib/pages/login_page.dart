import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recruitment_app/pages/Profile_creation.dart';
import 'package:recruitment_app/pages/home_page.dart';

import 'package:recruitment_app/pages/register_page.dart';

import 'package:animate_do/animate_do.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  var emailctrl = TextEditingController();
  var passctrl = TextEditingController();

  void loginUser() {
    // Mock login logic
    if (_formkey.currentState!.validate()) {
      // Display success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );

      // Navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine if the screen is small (mobile) or large (tablet/web)
    bool isSmallScreen = screenWidth < 600;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.indigo.shade200,
              Colors.indigo.shade300,
              Colors.indigoAccent.shade400,
            ],
          ),
        ),
        child: Center(
          child: Form(
            key: _formkey,
            child: Card(
              elevation: 10,
              child: Container(
                width: isSmallScreen ? screenWidth * 0.85 : screenWidth * 0.4,
                padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 20 : 40,
                  horizontal: isSmallScreen ? 16 : 32,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 15),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        "HELLO THERE",
                        style: GoogleFonts.acme(fontSize: isSmallScreen ? 24 : 30),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1100),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          controller: emailctrl,
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            helperStyle: GoogleFonts.aBeeZee(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1200),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          controller: passctrl,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: GoogleFonts.aBeeZee(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: ElevatedButton(
                        onPressed: loginUser,
                        child: const Text("Login"),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Row(
                        children: [
                          Container(color: Colors.black, height: 2, width: 110),
                          const SizedBox(width: 12),
                          const Center(child: Text("or")),
                          const SizedBox(width: 20),
                          Container(color: Colors.black, height: 2, width: 110),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1400),
                      child: const SizedBox(
                        width: 40,

                      ),
                    ),
                    SizedBox(height: 20),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: Text(
                          "New User! Register Here",
                          style: GoogleFonts.acme(fontSize: isSmallScreen ? 16 : 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
