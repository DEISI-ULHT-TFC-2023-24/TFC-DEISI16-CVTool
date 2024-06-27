class Comentarios {
  final String id;
  final String author;
  final String data;
  final String comment;


  Comentarios({
    required this.id,
    required this.author,
    required this.data,
    required this.comment
  });

  factory Comentarios.fromMap(Map<String, dynamic> map) {
    return Comentarios(
      id: map['id'].toString(),  // Ensuring id is a String
      author: map['author'] ?? '',
      data: map['data'] ?? '',
      comment: map['comentario'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'data': data,
      'comentario': comment,
    };
  }
}
