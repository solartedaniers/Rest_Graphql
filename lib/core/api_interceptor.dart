import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiInterceptor {
  // Antes de enviar la petición (Request)
  static Map<String, String> interceptRequest(Map<String, String>? headers) {
    final Map<String, String> updatedHeaders = Map.from(headers ?? {});
    updatedHeaders['Content-Type'] = 'application/json';
    updatedHeaders['Accept'] = 'application/json';
    
    log('--- HTTP REQUEST ---');
    log('Headers: $updatedHeaders');
    return updatedHeaders;
  }

  // Después de recibir la respuesta (Response)
  static http.Response interceptResponse(http.Response response) {
    log('--- HTTP RESPONSE ---');
    log('Status Code: ${response.statusCode}');
    log('Body: ${response.body}');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      log('Error detectado: ${response.reasonPhrase}');
      throw Exception('Error en la petición: ${response.statusCode}');
    }
  }
}