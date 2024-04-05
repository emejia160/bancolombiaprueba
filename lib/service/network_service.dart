import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';

class NetworkService {
  Client client = Client();
  Future<Response> get(String apiUrl) async {
    return client.get(apiUrl as Uri);
  }

  Future<Response> post(String _apiBaseUrl, dynamic data) {
    return client.post(_apiBaseUrl as Uri, body: data);
  }

  String getErrorMessage(dynamic exception) {
    String errorMessage = "Error en el servicio";
   if (exception is HttpException) {
      errorMessage = exception.message;
   }

    return errorMessage;
  }
}
