import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/screen/home/bottom-navigation-bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inovathon',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: CustomBottomNavigationBar(),
    );
  }
}
