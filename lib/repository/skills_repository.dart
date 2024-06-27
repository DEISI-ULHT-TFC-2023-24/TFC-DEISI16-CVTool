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
        List<Competencias> competencias =
        responseJSON.map((competencia) => Competencias.fromMap(competencia)).toList();
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
    return null;
  }

  // Get the Skill by author username
  Future<List<Competencias>?> getSkillsByAuthorUsername(String username) async {
    return null;
  }

  // Create a skill
  Future<String> createSkill(String name, String typeOfSkill, NormalUser author) async {
    return "";
  }

  // Delete skill by id
  Future<String> deleteSkillById(int id) async {
    return "";
  }
}