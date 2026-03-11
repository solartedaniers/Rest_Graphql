import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/university_controller.dart';

class UniversityListView extends StatelessWidget {
  final UniversityController controller = Get.put(UniversityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Universidades (REST)')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.universities.length,
          itemBuilder: (context, index) {
            final uni = controller.universities[index];
            return ListTile(
              title: Text(uni.name),
              subtitle: Text('País: ${uni.country}\nWeb: ${uni.webPages.isNotEmpty ? uni.webPages.first : 'N/A'}'),
              isThreeLine: true,
            );
          },
        );
      }),
    );
  }
}