import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home.dart'; // Import your HomePage

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    // Navigate to HomePage after 1 seconds
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Green background
      body: Center(
        child: Text(
          "Savvy Cart",
          style: TextStyle(
            fontSize: 40, 
            fontWeight: FontWeight.bold, 
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
