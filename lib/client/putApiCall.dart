import 'package:http/http.dart' as http;

Future<http.Response> putApiCall(String url, String accessTokken) {
  return http.put(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessTokken',
  });
}
