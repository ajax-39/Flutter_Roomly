import 'package:flutter/material.dart';
import 'package:hotelbooking/pages/bottomnav.dart';
import 'package:hotelbooking/pages/signup_page.dart';
import 'package:hotelbooking/services/firebase_services.dart';
import 'package:hotelbooking/services/widget_support.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
} 

class _LoginState extends State<Login> {
  // Firebase service
  final FirebaseServices _firebaseServices = FirebaseServices();

  // Text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Loading state
  bool _isLoading = false;

  // Login function
  void _login() async {
    // Check if fields are empty
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please fill all fields",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final user = await _firebaseServices.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      
      if (user != null) {
        // Navigate to bottom nav
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Bottomnav()),
        );
      }
    } catch (e) {
      String errorMessage = "Login failed. Please try again.";
      
      if (e.toString().contains("user-not-found")) {
        errorMessage = "User not found. Please check your email.";
      } else if (e.toString().contains("wrong-password")) {
        errorMessage = "Incorrect password. Please try again.";
      } else if (e.toString().contains("invalid-email")) {
        errorMessage = "Invalid email format.";
      }
      
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Reset password function
  void _resetPassword() async {
    if (_emailController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter your email to reset your password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    try {
      await _firebaseServices.resetPassword(email: _emailController.text.trim());
      Fluttertoast.showToast(
        msg: "Password reset email sent. Check your inbox.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to send reset email. Please check your email address.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/login.png",
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Text("LogIn", style: AppWidget.headlinetextstyle(25.0)),
              ),
              SizedBox(height: 5.0),
              Center(
                child: Text(
                  "Please enter the details to continue.",
                  style: AppWidget.normaltextstyle(18),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text("Email", style: AppWidget.normaltextstyle(20.0)),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email, color: Colors.blue),
                    hintText: "Enter Email",
                    hintStyle: AppWidget.normaltextstyle(18.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text("Password", style: AppWidget.normaltextstyle(20.0)),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock, color: Colors.blue),
                    hintText: "Enter Password",
                    hintStyle: AppWidget.normaltextstyle(18.0),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 30.0, top: 10.0),
                child: GestureDetector(
                  onTap: _resetPassword,
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                child: MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  onPressed: _isLoading ? null : _login,
                  color: Colors.blue,
                  disabledColor: Colors.blue.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _isLoading 
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "LogIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppWidget.normaltextstyle(16.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
