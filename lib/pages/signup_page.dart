import 'package:flutter/material.dart';
import 'package:hotelbooking/services/widget_support.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                  "assets/images/signup.png",
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  "Sign Up",
                  style: AppWidget.headlinetextstyle(25.0),
                ),
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
                child: Text("Name", style: AppWidget.normaltextstyle(20.0)),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person, color: Colors.green),
                    hintText: "Enter Name",
                    hintStyle: AppWidget.normaltextstyle(18.0),
                  ),
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
                    prefixIcon: Icon(Icons.email, color: Colors.green),
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
                    prefixIcon: Icon(Icons.lock, color: Colors.green),
                    hintText: "Enter Password",
                    hintStyle: AppWidget.normaltextstyle(18.0),
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
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Sign Up",
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
                    "Already have an account? ",
                    style: AppWidget.normaltextstyle(16.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to login page
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
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
