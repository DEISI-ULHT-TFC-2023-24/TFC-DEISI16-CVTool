import 'dart:convert';
import 'package:http/http.dart' as http;

class UtilizadorParticular {
  final int id;
  final String email;
  final String name;
  final String username;
  final String password;
  final String numeroDeTelemovel;

  UtilizadorParticular({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.password,
    required this.numeroDeTelemovel,
  });

  factory UtilizadorParticular.fromJson(Map<String, dynamic> json) {
    return UtilizadorParticular(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      username: json['username'],
      password: json['password'],
      numeroDeTelemovel: json['numeroDeTelemovel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'username': username,
      'password': password,
      'numeroDeTelemovel': numeroDeTelemovel,
    };
  }
}

class UtilizadorParticularRepository {
  final String baseUrl;

  UtilizadorParticularRepository({required this.baseUrl});

  Future<UtilizadorParticular?> getUserById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/api/userParticular/searchId/$id'));

    if (response.statusCode == 200) {
      return UtilizadorParticular.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<UtilizadorParticular?> getUserByName(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/api/userParticular/searchName/$name'));

    if (response.statusCode == 200) {
      return UtilizadorParticular.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<UtilizadorParticular?> getUserByUserName(String username) async {
    final response = await http.get(Uri.parse('$baseUrl/api/userParticular/searchUserName/$username'));

    if (response.statusCode == 200) {
      return UtilizadorParticular.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<UtilizadorParticular?> createUser(UtilizadorParticular user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/userParticular/add'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return UtilizadorParticular.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<bool> deleteUserById(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/api/userParticular/delete/$id'));

    return response.statusCode == 200;
  }

  Future<bool> deleteUserByUsername(String username) async {
    final response = await http.delete(Uri.parse('$baseUrl/api/userParticular/delete/$username'));

    return response.statusCode == 200;
  }

  Future<bool> updateUser(UtilizadorParticular user, String endpoint) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/userParticular/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> editUserUsernameNameById(int id, String username) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/userParticular/editUserName'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': id, 'username': username}),
    );

    return response.statusCode == 200;
  }

  Future<bool> editUserNameById(int id, String name) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/userParticular/editName'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': id, 'name': name}),
    );

    return response.statusCode == 200;
  }

  Future<bool> editUserPasswordById(int id, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/userParticular/editPassword'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': id, 'password': password}),
    );

    return response.statusCode == 200;
  }

  Future<bool> editUserJobById(int id, String profissao) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/userParticular/editJob'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': id, 'profissao': profissao}),
    );

    return response.statusCode == 200;
  }

  Future<bool> editUserContactById(int id, String contacto) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/userParticular/editContact'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': id, 'contacto': contacto}),
    );

    return response.statusCode == 200;
  }

  Future<bool> editUserEmailById(int id, String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/userParticular/editEmail'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': id, 'email': email}),
    );

    return response.statusCode == 200;
  }
}
