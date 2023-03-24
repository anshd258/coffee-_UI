import 'package:http/http.dart' as http;

class UserApiHandler {
  Future<http.Response> getApiCall(String url, String accessTokken) {
    return http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
  }

  Future<http.Response> putApiCall(String url, String accessTokken) {
    return http.put(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
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
