import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final http.Client _client;

  ApiService(this.baseUrl, this._client);

  Future<http.Response> get(String endpoint) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }

    return response;
  }

  /// TODO: Add more methods here
}
