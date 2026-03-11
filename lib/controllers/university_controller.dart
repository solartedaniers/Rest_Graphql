import 'package:get/get.dart';
import '../models/university_model.dart';
import '../services/rest_service.dart';

class UniversityController extends GetxController {
  final RestService _service = RestService();
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
      universities.assignAll(await _service.getUniversities('Colombia'));
    } catch (e) {
      Get.snackbar('Error', 'Fallo al cargar universidades');
    } finally {
      isLoading(false);
    }
  }
}