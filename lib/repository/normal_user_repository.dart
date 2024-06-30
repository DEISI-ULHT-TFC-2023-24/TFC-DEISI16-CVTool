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
        List<NormalUser> usersNormal =
        responseJSON.map((user) => NormalUser.fromMap(user)).toList();
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
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/userParticular/searchId/$id',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return NormalUser.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('NormalUser not found');
      return null;
    } else {
      throw Exception(
          'Failed to load NormalUser, status code: ${response.statusCode}');
    }
  }

  // Get the user by name
  Future<NormalUser?> getUserByName(String name) async {
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/userParticular/searchName/$name',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return NormalUser.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('NormalUser not found');
      return null;
    } else {
      throw Exception(
          'Failed to load NormalUser, status code: ${response.statusCode}');
    }
  }

  // Get the user by username
  Future<NormalUser?> getUserByUsername(String username) async {
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/userParticular/searchUserName/$username',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return NormalUser.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('NormalUser not found');
      return null;
    } else {
      throw Exception(
          'Failed to load NormalUser, status code: ${response.statusCode}');
    }
  }

  // Create a new user
  Future<String> createNewUser({
    required String email,
    required String name,
    required String username,
    required String gender,
    required String job,
    required String phoneNumber,
    required int age,
    required String password,
  }) async {
    final Map<String, dynamic> user = {
      'id': 0,
      'email': email,
      'name': name,
      'username': username,
      'gender': gender,
      'profissao': job,
      'contacto': phoneNumber,
      'idade': age,
      'password': password,
    };

    final response = await _client.post(
      url: 'http://10.0.2.2:8080/api/userParticular/add',
      headers: {
        'Content-Type': 'application/json',
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 201) {
      return 'User created successfully';
    } else if (response.statusCode == 409) {
      return 'Conflict: ${response.body}';
    } else {
      throw Exception(
          'Failed to create Normal user, status code: ${response.statusCode}');
    }
  }

  // Delete user by id
  Future<String> deleteUserById(int id) async {
    // API
    final response = await _client.delete(
      url: ('http://10.0.2.2:8080/api/userParticular/delete/byId/$id'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      return "User with id $id deleted successfully!";
    } else if (response.statusCode == 404) {
      return 'User not found';
    } else {
      throw Exception(
          'Failed to delete the User, status code: ${response.statusCode}');
    }
  }

  // Delete user by username
  Future<String> deleteUserByUsername(String username) async {
    // API
    final response = await _client.delete(
      url: ('http://10.0.2.2:8080/api/userParticular/delete/byUsername/$username'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      return "User with id $username deleted successfully!";
    } else if (response.statusCode == 404) {
      return 'User not found';
    } else {
      throw Exception(
          'Failed to delete the User, status code: ${response.statusCode}');
    }
  }

  // Edit User by id
  Future<String> editUserById({
    required int id,
    required String email,
    required String name,
    required String username,
    required String gender,
    required String job,
    required String phoneNumber,
    required int age,
    required String password,
  }) async {
    final Map<String, dynamic> user = {
      'id': id,
      'email': email,
      'name': name,
      'username': username,
      'gender': gender,
      'profissao': job,
      'contacto': phoneNumber,
      'idade': age,
      'password': password,
    };

    final response = await _client.put(
      url: 'http://10.0.2.2:8080/api/editUser',
      headers: {
        'Content-Type': 'application/json',
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      return 'User updated successfully';
    } else if (response.statusCode == 404) {
      return 'Not Found: ${response.body}';
    } else {
      throw Exception(
          'Failed to edit user, status code: ${response.statusCode}');
    }
  }

  // Validates the user and gets the user
  Future<NormalUser?> getUserAfterValidation(String username, String password) async {
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/userParticular/validator/$username/$password',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return NormalUser.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('Normal user not found');
      return null;
    } else {
      throw Exception(
          'Failed to load normal user, status code: ${response.statusCode}');
    }
  }
}
