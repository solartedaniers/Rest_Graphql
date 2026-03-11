import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/country_controller.dart';

class CountryInfoView extends StatelessWidget {
  final CountryController controller = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Info País (GraphQL)')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final country = controller.country.value;
        if (country == null) return const Center(child: Text('No hay datos'));
        
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nombre: ${country.name}', style: const TextStyle(fontSize: 18)),
              Text('Capital: ${country.capital}'),
              Text('Moneda: ${country.currency}'),
              Text('Continente: ${country.continent}'),
              Text('Idiomas: ${country.languages.join(", ")}'),
            ],
          ),
        );
      }),
    );
  }
}