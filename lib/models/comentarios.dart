import 'package:tfc_versaofinal/models/normal_user.dart';

class Comentarios {
  final String id;
  final String author;
  final String data;
  final String comentario;


  Comentarios({
    required this.id,
    required this.author,
    required this.data,
    required this.comentario
  });

  factory Comentarios.fromMap(Map<String, dynamic> map) {
    return Comentarios(
      id: map['id'].toString(),  // Ensuring id is a String
      author: map['author'] ?? '',
      data: map['data'] ?? '',
      comentario: map['comentario'] ?? '',
    );
  }
}
