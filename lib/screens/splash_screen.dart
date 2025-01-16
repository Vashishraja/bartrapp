import 'package:flutter/material.dart';
import 'package:bartrapp/screens/get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to GetStartedPage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GetStartedPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue, // Blue background color
      body: Center(
        child: Image.asset(
          'assets/blogo.png', // Replace with your logo path
          width: MediaQuery.of(context).size.width * 0.8,

        ),
      ),
    );
  }
}
