import 'package:http/http.dart' as http;

Future<http.Response> getApiCall(String url, String accessTokken) {
  return http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessTokken',
  });
}
