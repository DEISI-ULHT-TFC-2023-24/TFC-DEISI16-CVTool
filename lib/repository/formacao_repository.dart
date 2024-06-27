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

  // List that gets all the Formacoes.
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

  // Get the Formacao by id
  Future<FormacaoAcademica?> getFormacaoById(int id) async {
    return null;
  }

  // Get the Formacao by author username
  Future<FormacaoAcademica?> getFormacaoByAuthorUsername(String username) async {
    return null;
  }

  // Create a offer by id
  Future<String> createFormacao(String name, String typeOfFormation, String institute, String duration, NormalUser author) async {
    return "";
  }

  // Delete offer by id
  Future<String> deleteFormacaoById(int id) async {
    return "";
  }
}