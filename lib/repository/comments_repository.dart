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
    // Call API to get normal Users.
    final response = await _client.get(
      url: ('http://10.0.2.2:8080/api/comentarios/listOfUser/$id'),
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
        responseJSON.map((comment) => Comentarios.fromMap(comment.cast<String, dynamic>())).toList();
        return comments;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Status code: ${response.statusCode}');
    }
  }

  // Create a comment
  Future<String> createComment(String author, int id, String comment, String date) async {
    final Map<String, dynamic> commentData = {
      'id': id,
      'author': author,
      'data': date,
      'comentario': comment,
    };

    final response = await _client.post(
      url: 'http://10.0.2.2:8080/api/comentarios/add',
      headers: {
        'Content-Type': 'application/json',
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
      body: jsonEncode(commentData),
    );

    if (response.statusCode == 201) {
      return 'Comment created successfully';
    } else if (response.statusCode == 409) {
      return 'Conflict: Comment with these details already exists.';
    } else {
      throw Exception('Failed to create comment, status code: ${response.statusCode}');
    }
  }

  // Delete comment by id
  Future<String> deleteCommentById(int id) async {
    // API
    final response = await _client.delete(
      url: ('http://10.0.2.2:8080/api/comentarios/deleteComment/$id'),
      headers: {
        'x-api-token': '12345',
        'Authorization': basicAuth,
      },
    );
    // Success Case
    if (response.statusCode == 200) {
      return "Comment with id $id deleted successfully!";
    } else if (response.statusCode == 404) {
      return 'Comment not found';
    } else {
      throw Exception(
          'Failed to delete the Comment, status code: ${response.statusCode}');
    }
  }
}
