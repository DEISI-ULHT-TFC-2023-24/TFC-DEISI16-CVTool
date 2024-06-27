import 'package:tfc_versaofinal/models/normal_user.dart';

class FormacaoAcademica {
  final String id;
  final String name;
  final String type;
  final String institute;
  final String duration;
  final NormalUser? author;


  FormacaoAcademica({
    required this.id,
    required this.name,
    required this.type,
    required this.institute,
    required this.duration,
    required this.author
  });

  factory FormacaoAcademica.fromMap(Map<String, dynamic> map) {
    return FormacaoAcademica(
      id: map['id'].toString(),  // Ensuring id is a String
      name: map['nome'] ?? '',
      type: map['tipoformacao'] ?? '',
      institute: map['instituto'] ?? '',
      duration: map['duracao'] ?? '',
      author: map['author'] ?? '',
    );
  }
}
