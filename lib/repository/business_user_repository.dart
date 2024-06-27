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

  // Get the user by id
  Future<BusinessUser?> getBusinessUserById(int id) async {
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/businessUsers/searchId/$id',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return BusinessUser.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('Business user not found');
      return null;
    } else {
      throw Exception(
          'Failed to load business user, status code: ${response.statusCode}');
    }
  }

  // Get the user by name
  Future<BusinessUser?> getBusinessUserByName(String name) async {
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/businessUsers/searchName/$name',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return BusinessUser.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('Business user not found');
      return null;
    } else {
      throw Exception(
          'Failed to load business user, status code: ${response.statusCode}');
    }
  }

  // Get the user by username
  Future<BusinessUser?> getBusinessUserByUserName(String username) async {
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/businessUsers/searchUserName/$username',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return BusinessUser.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('Business user not found');
      return null;
    } else {
      throw Exception(
          'Failed to load business user, status code: ${response.statusCode}');
    }
  }

  // Create business user
  Future<String> createBusinessUser(String email, String name, String username, String gender, String job, String phoneNumber, int age, String password, String company) async {
    final Map<String, dynamic> user = {
      'email': email,
      'name': name,
      'username': username,
      'gender': gender,
      'profissao': job,
      'numeroDeTelemovel': phoneNumber,
      'age': age,
      'password': password,
      'empresa': company,
    };

    final response = await _client.post(
      url: 'http://10.0.2.2:8080/api/businessUsers/add',
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
          'Failed to create business user, status code: ${response.statusCode}');
    }
  }

// Delete user by id
  Future<String> deleteUserById(int id) async {
    // API
    final response = await _client.delete(
      url: ('http://10.0.2.2:8080/api/businessUsers/delete/$id'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      return "User with id $id deleted successfully!";
    } else if (response.statusCode == 404) {
      return 'Business user not found';
    } else {
      throw Exception(
          'Failed to delete business user, status code: ${response.statusCode}');
    }
  }

// Delete user by username
  Future<String> deleteUserByUsername(String username) async {
    // API
    final response = await _client.delete(
      url: ('http://10.0.2.2:8080/api/businessUsers/deleteByUserName/$username'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      return "User with username $username deleted successfully!";
    } else if (response.statusCode == 404) {
      return 'Business user not found';
    } else {
      throw Exception(
          'Failed to delete business user, status code: ${response.statusCode}');
    }
  }

// Edit business user
  Future<String> editBusinessUser(int id, String email, String name, String username, String gender, String job, String phoneNumber, int age, String password, String company) async {
    final Map<String, dynamic> user = {
      'id': id,
      'email': email,
      'name': name,
      'username': username,
      'gender': gender,
      'profissao': job,
      'numeroDeTelemovel': phoneNumber,
      'age': age,
      'password': password,
      'empresa': company,
    };

    final response = await _client.put(
      url: 'http://10.0.2.2:8080/api/editBusinessUser',
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
          'Failed to edit business user, status code: ${response.statusCode}');
    }
  }

// Validates the user and gets the user
  Future<BusinessUser?> getTheBusinessUserAfterValidation(String username, String password) async {
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/businessUsers/validator/$username/$password',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return BusinessUser.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('Business user not found');
      return null;
    } else {
      throw Exception(
          'Failed to load business user, status code: ${response.statusCode}');
    }
  }
}
