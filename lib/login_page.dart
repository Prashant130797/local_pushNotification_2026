import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main_firebase_pushnotification/MVVM_FCM/home_Screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 250),

                Text(
                  'learning Managment System (LMS)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                  // style: GoogleFonts.poppins(
                  //   fontSize: 14,
                  //   color: Colors.grey[600],
                  // ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.facebookF,
                          color: Color(0xFF1877F2),
                        ),
                        label: Text(
                          'Facebook',
                          // style: GoogleFonts.poppins(
                          //   color: Colors.grey[700],
                          //   fontWeight: FontWeight.w500,
                          // ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.google,
                          color: Color(0xFFDB4437),
                        ),
                        label: Text(
                          'Google',
                          // style: GoogleFonts.poppins(
                          //   color: Colors.grey[700],
                          //   fontWeight: FontWeight.w500,
                          // ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Or',
                        // style: GoogleFonts.poppins(
                        //   color: Colors.grey[500],
                        //   fontSize: 14,
                        // ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[300])),
                  ],
                ),
                const SizedBox(height: 24),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'alphainvent@gmail.com',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: '........',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      // style: GoogleFonts.poppins(
                      //   color: Colors.grey[600],
                      //   fontWeight: FontWeight.w500,
                      //   fontSize: 12,
                      // ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                           return HomeScreen();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4461F2),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'Log In',
                      // style: GoogleFonts.poppins(
                      //   fontSize: 16,
                      //   fontWeight: FontWeight.w600,
                      // ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account? ",
                      // style: GoogleFonts.poppins(
                      //   color: Colors.grey[600],
                      //   fontSize: 14,
                      // ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Sign Up',
                        // style: GoogleFonts.poppins(
                        //   color: const Color(0xFF4461F2),
                        //   fontWeight: FontWeight.w600,
                        //   fontSize: 14,
                        // ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
