import 'package:tfc_versaofinal/models/business_user.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';

class Proposta {
  final String id;
  final String comment;
  final String area;
  final String descricao;
  final String skillRequired;
  final BusinessUser? author;
  final NormalUser? candidato;


  Proposta({
    required this.id,
    required this.comment,
    required this.area,
    required this.descricao,
    required this.skillRequired,
    required this.author,
    required this.candidato,
  });

  factory Proposta.fromMap(Map<String, dynamic> map) {
    return Proposta(
        id: map['id'].toString(),  // Ensuring id is a String
        comment: map['comment'] ?? '',
        area: map['area'] ?? '',
        descricao: map['descricao'] ?? '',
        skillRequired: map['skillsRequired'] ?? '',
        author: map['author'] ?? '',
        candidato: map['candidate'] ?? '',
    );
  }
}
