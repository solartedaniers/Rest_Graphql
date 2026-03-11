import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/university_controller.dart';

class UniversityListView extends StatelessWidget {
  const UniversityListView({super.key});

  @override
  Widget build(BuildContext context) {
    final UniversityController controller = Get.put(UniversityController());
    return Scaffold(
      appBar: AppBar(title: const Text('Universidades')),
      body: Obx(() => controller.isLoading.value 
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.universities.length,
              itemBuilder: (context, index) {
                final uni = controller.universities[index];
                return ListTile(title: Text(uni.name), subtitle: Text(uni.country));
              })),
    );
  }
}