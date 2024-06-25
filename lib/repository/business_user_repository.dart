import 'dart:convert';
import 'package:tfc_versaofinal/models/business_user.dart';
import 'package:tfc_versaofinal/utils/http/http_client.dart';

class BusinessUserRepository {
  final HttpClient _client;

  // Client.
  BusinessUserRepository({required HttpClient client}) : _client = client;

  // Encode.
  String basicAuth = 'Basic ${base64Encode(utf8.encode('admin:123'))}';

  // List that gets all the normal users.
  Future<List<BusinessUser>> getBusinessUsers() async {
    // Call API to get normal Users.
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/businessUsers/list',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      List businessUsers = responseJSON['docs'];

      List<BusinessUser> usersRequested =
          businessUsers.map((user) => BusinessUser.fromMap(user)).toList();

      return usersRequested;
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }
}
