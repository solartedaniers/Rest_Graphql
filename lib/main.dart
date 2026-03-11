import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/home_view.dart';

void main() => runApp(const UniversityExplorerApp());

class UniversityExplorerApp extends StatelessWidget {
  const UniversityExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'University Explorer',
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}