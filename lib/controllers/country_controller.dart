import 'package:get/get.dart';
import '../models/country_model.dart';
import '../services/graphql_service.dart';

class CountryController extends GetxController {
  final GraphQlService _service = GraphQlService();
  
  // Observables
  Rxn<Country> country = Rxn<Country>();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCountryInfo();
  }

  void fetchCountryInfo() async {
    try {
      isLoading(true);
      // 'CO' es el código para Colombia
      var result = await _service.getCountryInfo('CO');
      country.value = result;
    } catch (e) {
      Get.snackbar('Error', 'Error al obtener datos del país');
    } finally {
      isLoading(false);
    }
  }
}