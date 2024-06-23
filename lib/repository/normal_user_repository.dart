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
      List normalUsers = responseJSON['docs'];

      List<NormalUser> usersNormal =
          normalUsers.map((user) => NormalUser.fromMap(user)).toList();

      return usersNormal;
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Get the user by id.
  NormalUser? getUserById(String id) {



//dd
    return NormalUser(
        id: '1',
        email: 'Dioni@gmail.com',
        name: 'Dio',
        username: 'Dioni',
        job: 'Engenheiro Informático',
        phoneNumber: '962821351',
        age: '21',
        password: 'Dedi1234!');
  }
}
