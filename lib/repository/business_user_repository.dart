import 'dart:convert';
import 'package:tfc_versaofinal/models/business_user.dart';
import 'package:tfc_versaofinal/utils/http/http_client.dart';

class BusinessUserRepository {
  final HttpClient _client;

  BusinessUserRepository({required HttpClient client}) : _client = client;

  String basicAuth = 'Basic ${base64Encode(utf8.encode('admin:123'))}';

  Future<List<BusinessUser>> getBusinessUsers() async {
    try {
      final response = await _client.get(
        url: 'http://10.0.2.2:8080/api/businessUsers/list',
        headers: {
          'x-api-token': '12345',
          'Authorization': basicAuth,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseJSON = jsonDecode(response.body)['docs'];
        List<BusinessUser> businessUsers = responseJSON
            .map((user) => BusinessUser.fromMap(user))
            .toList();
        return businessUsers;
      } else {
        throw Exception('Failed to load business users, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load business users: $e');
    }
  }

  Future<BusinessUser?> getBusinessUserById(int id) async {
    try {
      final response = await _client.get(
        url: 'http://10.0.2.2:8080/api/businessUsers/searchId/$id',
        headers: {
          'x-api-token': '12345',
          'Authorization': basicAuth,
        },
      );

      if (response.statusCode == 200) {
        final responseJSON = jsonDecode(response.body);
        return BusinessUser.fromMap(responseJSON);
      } else if (response.statusCode == 404) {
        print('Business user not found');
        return null;
      } else {
        throw Exception('Failed to load business user, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load business user: $e');
    }
  }

  Future<BusinessUser?> getBusinessUserByName(String name) async {
    try {
      final response = await _client.get(
        url: 'http://10.0.2.2:8080/api/businessUsers/searchName/$name',
        headers: {
          'x-api-token': '12345',
          'Authorization': basicAuth,
        },
      );

      if (response.statusCode == 200) {
        final responseJSON = jsonDecode(response.body);
        return BusinessUser.fromMap(responseJSON);
      } else if (response.statusCode == 404) {
        print('Business user not found');
        return null;
      } else {
        throw Exception('Failed to load business user, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load business user: $e');
    }
  }

  Future<BusinessUser?> getBusinessUserByUserName(String username) async {
    try {
      final response = await _client.get(
        url: 'http://10.0.2.2:8080/api/businessUsers/searchUserName/$username',
        headers: {
          'x-api-token': '12345',
          'Authorization': basicAuth,
        },
      );

      if (response.statusCode == 200) {
        final responseJSON = jsonDecode(response.body);
        return BusinessUser.fromMap(responseJSON);
      } else if (response.statusCode == 404) {
        print('Business user not found');
        return null;
      } else {
        throw Exception('Failed to load business user, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load business user: $e');
    }
  }

  Future<String> createBusinessUser({
    required String email,
    required String name,
    required String username,
    required String gender,
    required String job,
    required String phoneNumber,
    required int age,
    required String password,
    required String company,
  }) async {
    final Map<String, dynamic> user = {
      'email': email,
      'name': name,
      'username': username,
      'gender': gender,
      'profissao': job,
      'contacto': phoneNumber,
      'age': age,
      'password': password,
      'empresa': company,
    };

    try {
      final response = await _client.post(
        url: 'http://10.0.2.2:8080/api/businessUsers/add',
        headers: {
          'Content-Type': 'application/json', // Ensure Content-Type is application/json
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
        throw Exception('Failed to create business user, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create business user: $e');
    }
  }


  Future<String> deleteUserById(int id) async {
    try {
      final response = await _client.delete(
        url: 'http://10.0.2.2:8080/api/businessUsers/delete/$id',
        headers: {
          'x-api-token': '12345',
          'Authorization': basicAuth,
        },
      );

      if (response.statusCode == 200) {
        return "User with id $id deleted successfully!";
      } else if (response.statusCode == 404) {
        return 'Business user not found';
      } else {
        throw Exception('Failed to delete business user, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete business user: $e');
    }
  }

  Future<String> deleteUserByUsername(String username) async {
    try {
      final response = await _client.delete(
        url: 'http://10.0.2.2:8080/api/businessUsers/deleteByUserName/$username',
        headers: {
          'x-api-token': '12345',
          'Authorization': basicAuth,
        },
      );

      if (response.statusCode == 200) {
        return "User with username $username deleted successfully!";
      } else if (response.statusCode == 404) {
        return 'Business user not found';
      } else {
        throw Exception('Failed to delete business user, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete business user: $e');
    }
  }

  Future<String> editBusinessUser(
      int id,
      String email,
      String name,
      String username,
      String gender,
      String job,
      String phoneNumber,
      int age,
      String password,
      String company,
      ) async {
    try {
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
        throw Exception('Failed to edit business user, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to edit business user: $e');
    }
  }

  Future<BusinessUser?> getTheBusinessUserAfterValidation(String username, String password) async {
    try {
      final response = await _client.get(
        url: 'http://10.0.2.2:8080/api/businessUsers/validator/$username/$password',
        headers: {
          'x-api-token': '12345',
          'Authorization': basicAuth,
        },
      );

      if (response.statusCode == 200) {
        final responseJSON = jsonDecode(response.body);
        return BusinessUser.fromMap(responseJSON);
      } else if (response.statusCode == 404) {
        print('Business user not found');
        return null;
      } else {
        throw Exception('Failed to load business user, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load business user: $e');
    }
  }
}
