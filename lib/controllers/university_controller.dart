import 'package:get/get.dart';
import '../models/university_model.dart';
import '../services/rest_service.dart';

class UniversityController extends GetxController {
  final RestService _service = RestService();
  
  // Observables para la UI
  var universities = <University>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUniversities();
  }

  void fetchUniversities() async {
    try {
      isLoading(true);
      var result = await _service.getUniversities('Colombia');
      universities.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', 'No se pudieron cargar las universidades');
    } finally {
      isLoading(false);
    }
  }
}
