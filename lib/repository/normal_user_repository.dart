import 'dart:convert';
import 'package:tfc_versaofinal/utils/http/http_client.dart';
import '../models/normal_user.dart';

class NormalUserRepository {
  final HttpClient _client;

  // Client.
  NormalUserRepository({required HttpClient client}) : _client = client;

  // Encode.
  String basicAuth = 'Basic ${base64Encode(utf8.encode('admin:123'))}';

  // List that gets all the normal users.
  Future<List<NormalUser>> getNormalUsers() async {
    // Call API to get normal Users.
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/userParticular/list',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List) {
        List<NormalUser> usersNormal = responseJSON
            .map((user) => NormalUser.fromMap(user))
            .toList();
        return usersNormal;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Get the user by id.
  Future<NormalUser?> getUserById(String id) async {
    // API and headers.
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/userParticular/searchId/$id',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    // API Validation.
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List && responseJSON.isNotEmpty) {
        final normalUser = responseJSON[0];
        return NormalUser.fromMap(normalUser);
      } else {
        throw Exception('Invalid response format or no user found with the given ID');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }
}
