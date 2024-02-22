import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/app/view/home/home_screen.dart';
import 'package:flutter_delivery_app/app/view/on_boarding/on_boarding.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(
        useMaterial3: true
      ),
    home:const OnboardingScreen(), 
    );
    
  }
}

