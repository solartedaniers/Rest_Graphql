import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/university_controller.dart';

class UniversityListView extends StatelessWidget {
  const UniversityListView({super.key});

  @override
  Widget build(BuildContext context) {
    final UniversityController controller = Get.put(UniversityController());
    return Scaffold(
      appBar: AppBar(title: const Text('Universidades en Colombia'), elevation: 2),
      body: Obx(() => controller.isLoading.value 
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.universities.length,
              itemBuilder: (context, index) {
                final uni = controller.universities[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.school)),
                    title: Text(uni.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Dominio: ${uni.webPages.isNotEmpty ? uni.webPages.first : 'N/A'}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              })),
    );
  }
}