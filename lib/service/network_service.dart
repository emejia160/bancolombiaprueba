import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkService {
  Future<Response> get(String apiUrl) async {
    return http.get(apiUrl as Uri);
  }

  Future<Response> post(String _apiBaseUrl, dynamic data) {
    return http.post(_apiBaseUrl as Uri, body: data);
  }

  Map<String, dynamic> convertJsonToMap(String response) {
    return json.decode(response);
  }

  String getErrorMessage(dynamic exception) {
    String errorMessage = "";
   if (exception is HttpException) {
      errorMessage = exception.message;
   }

    return errorMessage;
  }
}
