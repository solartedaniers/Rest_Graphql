import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/university_model.dart';
import '../core/api_interceptor.dart';

class RestService {
  final String baseUrl = "http://universities.hipolabs.com";

  Future<List<University>> getUniversities(String country) async {
    final url = Uri.parse('$baseUrl/search?country=$country');
    
    // Interceptar Headers
    final headers = ApiInterceptor.interceptRequest(null);

    try {
      final response = await http.get(url, headers: headers);

      // Interceptar Respuesta
      final interceptedResponse = ApiInterceptor.interceptResponse(response);

      final List<dynamic> data = json.decode(interceptedResponse.body);
      return data.map((json) => University.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}