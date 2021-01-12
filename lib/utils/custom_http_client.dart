import 'package:http/http.dart' as http;

class CustomHttpClient extends http.BaseClient {
  http.Client _httpClient = http.Client();

  final Map<String, String> defaultHeaders = {
    "Content-Type": "application/json"
  };

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // TODO: implement send
    throw UnimplementedError();
  }
}
