import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://reqres.in';

  Future sampleLoginSuccesful() async {
    final uri = Uri.parse(baseUrl + '/api/login');
    await http.post(uri, body: {
      'email': 'eve.holt@reqres.in',
      'password': 'cityslicka',
    });
  }

  Future sampleLoginFailure() async {
    final uri = Uri.parse(baseUrl + '/api/login');

    final response = await http.post(uri, body: {'email': 'error@error'});
    try {
      throw Exception(response.body);
    } catch (error, stackTrace) {
      log(
        response.body,
        name: 'NETWORK',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future sampleUsers() async {
    final uri = Uri.parse(baseUrl + '/api/users');
    await http.get(uri);
  }
}
