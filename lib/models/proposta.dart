import 'package:tfc_versaofinal/models/business_user.dart';
import 'package:tfc_versaofinal/models/normal_user.dart';
import 'comentarios.dart';


class Proposta {
  final int id;
  final Comentarios? comment;
  final String area;
  final String descricao;
  final String skillRequired;
  final BusinessUser author;
  final NormalUser? candidate;


  Proposta({
    required this.id,
    required this.comment,
    required this.area,
    required this.descricao,
    required this.skillRequired,
    required this.author,
    required this.candidate,
  });

  factory Proposta.fromMap(Map<String, dynamic> map) {
    return Proposta(
      id: map['id'],
      comment: map['comment'] != null ? Comentarios.fromMap(map['comment']) : null,
      area: map['area'] ?? '',
      descricao: map['descricao'] ?? '',
      skillRequired: map['skillsRequired'] ?? '',
      author: map['author'] = BusinessUser.fromMap(map['author']),
      candidate: map['candidate'] != null ? NormalUser.fromMap(map['candidate']) : null,
    );
  }
}
