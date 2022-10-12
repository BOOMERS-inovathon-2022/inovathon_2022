import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/screen/home/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => HomeWidget();
}
