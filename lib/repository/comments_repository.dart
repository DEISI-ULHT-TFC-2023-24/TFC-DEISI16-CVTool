import 'dart:convert';
import 'package:tfc_versaofinal/models/comentarios.dart';
import 'package:tfc_versaofinal/utils/http/http_client.dart';

class CommentsRepository {
  final HttpClient _client;

  // Client.
  CommentsRepository({required HttpClient client}) : _client = client;

  // Encode.
  String basicAuth = 'Basic ${base64Encode(utf8.encode('admin:123'))}';

  // List that gets all the Comments.
  Future<List<Comentarios>> getCommentsList() async {
    // Call API to get normal Users.
    final response = await _client.get(
      url: 'http://10.0.2.2:8080/api/comentarios/list',
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      print('Response JSON: $responseJSON'); // Debugging line

      if (responseJSON is List) {
        List<Comentarios> comments =
        responseJSON.map((comment) => Comentarios.fromMap(comment)).toList();
        return comments;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Get the Comment by id
  Future<List<Comentarios>?> getCommentById(int id) async {
    return null;
  }

  // Create a comment
  Future<String> createComment(String username, int id, String comments, String date) async {
    return "";
  }

  // Delete comment by id
  Future<String> deleteCommentById(int id) async {
    return "";
  }
}