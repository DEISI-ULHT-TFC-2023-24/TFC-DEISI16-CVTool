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
    // API
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/experiencias/searchId/$id',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      return ExperienciaLaboral.fromMap(responseJSON);
    } else if (response.statusCode == 404) {
      // Handle the case when the user is not found
      print('Experience not found');
      return null;
    } else {
      throw Exception(
          'Failed to load Experience, status code: ${response.statusCode}');
    }
  }

  // Get the Experience by username
  Future<List<ExperienciaLaboral>?> getExperienceByAuthor(String username) async {
    // Call API to get normal Users.
    final response = await _client.get(
      url: ('http://10.0.2.2:8080/api/experiencias/searchByAuthor/$username'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List) {
        List<ExperienciaLaboral> experiences =
        responseJSON.map((experience) => ExperienciaLaboral.fromMap(experience.cast<String, dynamic>())).toList();
        return experiences;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Get the Experience by company name
  Future<List<ExperienciaLaboral>?> getExperienceByCompanyName(String company) async {
    // Call API to get normal Users.
    final response = await _client.get(
      url: ('http://10.0.2.2:8080/api/experiencias/searchByCompany/$company'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List) {
        List<ExperienciaLaboral> experiences =
        responseJSON.map((experience) => ExperienciaLaboral.fromMap(experience.cast<String, dynamic>())).toList();
        return experiences;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Create a Experience
  Future<String> createExperience(int id, String city, String job, String companyName, String duration, BusinessUser author) async {
    final Map<String, dynamic> commentData = {
      'id': id,
      'cidade': city,
      'profissao': job,
      'nomeEmpresa': companyName,
      'duracaoDaExperiencia': duration,
      'author': author,
    };

    final response = await _client.post(
      url: 'http://10.0.2.2:8080/api/experiencias/add',
      headers: {
        'Content-Type': 'application/json',
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
      body: jsonEncode(commentData),
    );

    if (response.statusCode == 201) {
      return 'Experience created successfully';
    } else if (response.statusCode == 409) {
      return 'Conflict: Experience with these details already exists.';
    } else {
      throw Exception('Failed to create Experience, status code: ${response.statusCode}');
    }
  }

  // Delete Experience by id
  Future<String> deleteExperienceById(int id) async {
    // API
    final response = await _client.delete(
      url: ('http://10.0.2.2:8080/api/experiencia/delete/byId/$id'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      return "Experience with id $id deleted successfully!";
    } else if (response.statusCode == 404) {
      return 'Experience not found';
    } else {
      throw Exception(
          'Failed to delete the Experience, status code: ${response.statusCode}');
    }
  }
}