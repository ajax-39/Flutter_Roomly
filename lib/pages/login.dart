import 'package:flutter/material.dart';
import 'package:hotelbooking/pages/signup_page.dart';
import 'package:hotelbooking/services/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  onTap: () {
                    // Handle forgot password
                  },
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
                  onPressed: () {},
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
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
                      // Navigate to signup page
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
