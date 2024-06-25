import 'package:tfc_versaofinal/models/normal_user.dart';

class ExperienciaLaboral {
  final String id;
  final String cidade;
  final String profissao;
  final String nomeEmpresa;
  final String duracaoDaExperiencia;
  final NormalUser? author;


  ExperienciaLaboral({
    required this.id,
    required this.cidade,
    required this.profissao,
    required this.nomeEmpresa,
    required this.duracaoDaExperiencia,
    required this.author
  });

  factory ExperienciaLaboral.fromMap(Map<String, dynamic> map) {
    return ExperienciaLaboral(
      id: map['id'].toString(),  // Ensuring id is a String
      cidade: map['cidade'] ?? '',
      profissao: map['profissao'] ?? '',
      nomeEmpresa: map['nomeEmpresa'] ?? '',
      duracaoDaExperiencia: map['duracaoDaExperiencia'] ?? '',
      author: map['author'] ?? '',
    );
  }
}
