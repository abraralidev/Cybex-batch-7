import 'package:class_9/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {

      if (_auth.currentUser == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      }

    }); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
