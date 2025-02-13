import 'package:flutter/material.dart';
import 'views/home_screen.dart';

void main() {
  runApp(const FundiSmartApp());
}

class FundiSmartApp extends StatelessWidget {
  const FundiSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FundiSmart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeView(),
    );
  }
}
