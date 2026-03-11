import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiInterceptor {
  static Map<String, String> interceptRequest(Map<String, String>? headers) {
    final Map<String, String> updatedHeaders = Map.from(headers ?? {});
    updatedHeaders['Content-Type'] = 'application/json';
    return updatedHeaders;
  }

  static http.Response interceptResponse(http.Response response) {
    log('HTTP Response: ${response.statusCode}');
    return response;
  }
}