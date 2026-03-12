import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/country_controller.dart';

class CountryInfoView extends StatelessWidget {
  const CountryInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final CountryController controller = Get.put(CountryController());
    return Scaffold(
      appBar: AppBar(title: const Text('Información del País')),
      body: Obx(() {
        if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());
        final c = controller.country.value;
        if (c == null) return const Center(child: Text('Datos no disponibles'));

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildInfoCard(Icons.flag, "País", c.name),
              _buildInfoCard(Icons.location_city, "Capital", c.capital),
              _buildInfoCard(Icons.attach_money, "Moneda", c.currency),
              _buildInfoCard(Icons.language, "Idiomas", c.languages.join(", ")),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}