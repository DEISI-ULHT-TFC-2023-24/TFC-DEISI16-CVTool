import 'dart:convert';
import 'package:tfc_versaofinal/models/formacao_academica.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';
import 'package:tfc_versaofinal/utils/http/http_client.dart';

class FormacaoRepository {
  final HttpClient _client;

  // Client.
  FormacaoRepository({required HttpClient client}) : _client = client;

  // Encode.
  String basicAuth = 'Basic ${base64Encode(utf8.encode('admin:123'))}';

  // List that gets all the formations.
  Future<List<FormacaoAcademica>> getFormacoesList() async {
    // Call API to get normal Users.
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/formacoes/list',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List) {
        List<FormacaoAcademica> formacoes =
        responseJSON.map((formacao) => FormacaoAcademica.fromMap(formacao)).toList();
        return formacoes;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Get the formation by id
  Future<FormacaoAcademica?> getFormacaoById(int id) async {
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/formacao/searchId/$id',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return FormacaoAcademica.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('Formação not found');
      return null;
    } else {
      throw Exception(
          'Failed to load Formação, status code: ${response.statusCode}');
    }
  }

  // Get the formation by author username
  Future<List<FormacaoAcademica>?> getFormacaoByAuthorUsername(String username) async {
    // Call API to get normal Users.
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/formacoes/searchByAuthor/$username',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List) {
        List<FormacaoAcademica> formacoes =
        responseJSON.map((formacao) => FormacaoAcademica.fromMap(formacao)).toList();
        return formacoes;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Create a formation by id
  Future<String> createFormacao(int id, String name, String typeOfFormation, String institute, String duration, NormalUser author) async {
    final Map<String, dynamic> commentData = {
      'id': id,
      'nome': name,
      'tipoformacao': typeOfFormation,
      'instituto': institute,
      'duracao': duration,
      'author': author,
    };

    final response = await _client.post(
      url: 'http://10.0.2.2:8080/api/formacoes/add',
      headers: {
        'Content-Type': 'application/json',
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
      body: jsonEncode(commentData),
    );

    if (response.statusCode == 201) {
      return 'Formation created successfully';
    } else if (response.statusCode == 409) {
      return 'Conflict: Formation with these details already exists.';
    } else {
      throw Exception('Failed to create formation, status code: ${response.statusCode}');
    }
  }

  // Delete formation by id
  Future<String> deleteFormacaoById(int id) async {
    // API
    final response = await _client.delete(
      url: ('http://10.0.2.2:8080/api/formacoes/delete/byId/$id'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      return "Formation with id $id deleted successfully!";
    } else if (response.statusCode == 404) {
      return 'Formation not found';
    } else {
      throw Exception(
          'Failed to delete the formation, status code: ${response.statusCode}');
    }
  }
}