import 'package:tfc_versaofinal/models/business_user.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';

class FormacaoAcademica {
  final String id;
  final String nome;
  final String tipoformacao;
  final String instituto;
  final String duracao;
  final NormalUser? author;


  FormacaoAcademica({
    required this.id,
    required this.nome,
    required this.tipoformacao,
    required this.instituto,
    required this.duracao,
    required this.author
  });

  factory FormacaoAcademica.fromMap(Map<String, dynamic> map) {
    return FormacaoAcademica(
      id: map['id'].toString(),  // Ensuring id is a String
      nome: map['nome'] ?? '',
      tipoformacao: map['tipoformacao'] ?? '',
      instituto: map['instituto'] ?? '',
      duracao: map['duracao'] ?? '',
      author: map['author'] ?? '',
    );
  }
}
