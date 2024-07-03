import 'dart:convert';
import 'package:tfc_versaofinal/models/competencias.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';
import 'package:tfc_versaofinal/utils/http/http_client.dart';

class SkillsRepository {
  final HttpClient _client;

  // Client.
  SkillsRepository({required HttpClient client}) : _client = client;

  // Encode.
  String basicAuth = 'Basic ${base64Encode(utf8.encode('admin:123'))}';

  // List that gets all the Skills.
  Future<List<Competencias>> getSkillsList() async {
    // Call API to get normal Users.
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/competencias/list',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List) {
        List<Competencias> competencias = responseJSON
            .map((competencia) => Competencias.fromMap(competencia))
            .toList();
        return competencias;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Get the Skill by id
  Future<Competencias?> getSkillById(int id) async {
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/competencias/searchId/$id',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return Competencias.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('Skill not found');
      return null;
    } else {
      throw Exception(
          'Failed to load the Skill, status code: ${response.statusCode}');
    }
  }

  // Get the Skill by author username
  Future<List<Competencias>?> getSkillsByAuthorUsername(String username) async {
    // Call API to get the skills by author username.
    final response = await _client.get(
      url: ('http://10.0.2.2:8080/api/competencias/searchByAuthor/$username'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List) {
        List<Competencias> competencias = responseJSON
            .map((competencia) =>
                Competencias.fromMap(competencia.cast<String, dynamic>()))
            .toList();
        return competencias;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Create a skill
  Future<String> createSkill({
      required String name,
      required String typeOfSkill,
      required NormalUser author
  }) async {
    final Map<String, dynamic> skillData = {
      'nome': name,
      'type': typeOfSkill,
      'author': author.toMap(),
    };

    final response = await _client.post(
      url: 'http://10.0.2.2:8080/api/competencias/add',
      headers: {
        'Content-Type': 'application/json',
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
      body: jsonEncode(skillData),
    );

    if (response.statusCode == 201) {
      return 'Skill created successfully';
    } else if (response.statusCode == 409) {
      return 'Conflict: Skill with these details already exists.';
    } else {
      throw Exception(
          'Failed to create skill, status code: ${response.statusCode}');
    }
  }

  // Delete skill by id
  Future<String> deleteSkillById(int id) async {
    // API
    final response = await _client.delete(
      url: ('http://10.0.2.2:8080/api/competencias/delete/byId/$id'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      return "Skill with id $id deleted successfully!";
    } else if (response.statusCode == 404) {
      return 'Skill not found';
    } else {
      throw Exception(
          'Failed to delete Skill, status code: ${response.statusCode}');
    }
  }
}
