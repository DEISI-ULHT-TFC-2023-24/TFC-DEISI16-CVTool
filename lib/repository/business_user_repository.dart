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
    return null;
  }

  // Get the user by name
  Future<BusinessUser?> getBusinessUserByName(String name) async {
    return null;
  }

  // Get the user by username
  Future<BusinessUser?> getBusinessUserByUserName(String username) async {
    return null;
  }

  // Create business user
  Future<String> createBusinessUser(String email, String name, String username, String gender, String job, String phoneNumber, int age, String password, String company) async {
    return "";
  }

  // Delete user by id
  Future<String> deleteUserById(int id) async {
    return "";
  }

  // Delete user by username
  Future<String> deleteUserByUsername(String username) async {
    return "";
  }

  // Edit business user
  Future<String> editBusinessUser(String email, String name, String username, String gender, String job, String phoneNumber, int age, String password, String company) async {
    return "";
  }

  // Validates the user and gets the user
  Future<BusinessUser?> getTheBusinessUserAfterValidation(String username, String password) async {
    return null;
  }
}
