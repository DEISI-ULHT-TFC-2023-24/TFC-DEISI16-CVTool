import 'package:http/http.dart';

class HttpClient {
  final client = Client();

  // Get
  Future<Response> get({required String url, Map<String, String>? headers}) {
    return client.get(Uri.parse(url), headers: headers);
  }

  // Post
  Future<Response> post({required String url, Map<String, String>? headers, Object? body}) {
    return client.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
  }

  // Delete
  Future<Response> delete({required String url, Map<String, String>? headers}) {
    return client.delete(Uri.parse(url), headers: headers);
  }

  // Put
  Future<Response> put({required String url, Map<String, String>? headers, Object? body}) {
    return client.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
  }
}