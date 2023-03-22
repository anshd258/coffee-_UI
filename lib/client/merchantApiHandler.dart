import 'package:http/http.dart' as http;

class MerchantApiHandler {
  Future<http.Response> getApiCall(String url, String accessTokken) {
    return http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
  }

  Future<http.Response> putApiCall(
      String url, String accessTokken, String body) {
    return http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessTokken',
        },
        body: body);
  }

  Future<http.Response> postApiCall(
      String url, String accessTokken, String data) {
    return http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessTokken',
        },
        body: data);
  }
}
