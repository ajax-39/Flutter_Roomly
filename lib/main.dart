import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/firebase_options.dart';
import 'package:hotelbooking/pages/bottomnav.dart';
import 'package:hotelbooking/pages/detaile_page.dart';
import 'package:hotelbooking/pages/home.dart';
import 'package:hotelbooking/pages/login.dart';
import 'package:hotelbooking/pages/signup_page.dart';
import 'package:hotelbooking/services/firebase_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final FirebaseServices firebaseServices = FirebaseServices();
    
    return MaterialApp(
      title: 'Hotel Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
      ),     
      home: firebaseServices.isUserLoggedIn ? const Bottomnav() : const Login(),
    );
  }
}
