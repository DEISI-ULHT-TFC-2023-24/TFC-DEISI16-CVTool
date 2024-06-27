import 'dart:convert';
import 'package:tfc_versaofinal/models/business_user.dart';
import 'package:tfc_versaofinal/models/experiencia_laboral.dart';
import 'package:tfc_versaofinal/utils/http/http_client.dart';

class ExperienciaRepository {
  final HttpClient _client;

  // Client.
  ExperienciaRepository({required HttpClient client}) : _client = client;

  // Encode.
  String basicAuth = 'Basic ${base64Encode(utf8.encode('admin:123'))}';

  // List that gets all the Experiences.
  Future<List<ExperienciaLaboral>> getExperiencesList() async {
    // Call API to get normal Users.
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/experiencias/list',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List) {
        List<ExperienciaLaboral> experiencias =
        responseJSON.map((experiencia) => ExperienciaLaboral.fromMap(experiencia)).toList();
        return experiencias;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Get the Experience by id
  Future<ExperienciaLaboral?> getExperienceById(int id) async {
    return null;
  }

  // Get the Experience by username
  Future<List<ExperienciaLaboral>?> getExperienceByUsername(String username) async {
    return null;
  }

  // Get the Experience by company name
  Future<List<ExperienciaLaboral>?> getExperienceByCompanyName(String company) async {
    return null;
  }

  // Create a Experience
  Future<String> createExperience(String city, String job, String companyName, String duration, BusinessUser author) async {
    return "";
  }

  // Delete Experience by id
  Future<String> deleteExperienceById(int id) async {
    return "";
  }
}