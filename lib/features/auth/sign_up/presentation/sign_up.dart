import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "New Account",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            // Full Name
            _buildTextField("Full name", "gemeda tamiru", false),

            // Password
            Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue.shade50,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Email
            _buildTextField("Email", "example@example.com", false),

            // Mobile Number
            _buildTextField("Mobile Number", "0914.....", false),

            // Role
            _buildTextField("Role", "Property Owner", false),

            SizedBox(height: 15),

            // Terms & Privacy
            Center(
              child: RichText(
                text: TextSpan(
                  text: "By continuing, you agree to ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Terms of Use",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: " and "),
                    TextSpan(
                      text: "Privacy Policy.",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),

            SizedBox(height: 15),

            // Social Login
            Center(child: Text("or sign up with", style: TextStyle(color: Colors.black54))),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton("assets/google.png"),
                SizedBox(width: 15),
                _buildSocialButton("assets/facebook.png"),
                SizedBox(width: 15),
                _buildSocialButton("assets/fingerprint.png"),
              ],
            ),

            SizedBox(height: 20),

            // Login Navigation
            Center(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/sign-in"),
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, bool obscure) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.blue.shade50,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        shape: BoxShape.circle,
      ),
      child: Image.asset(assetPath, width: 30),
    );
  }
}
