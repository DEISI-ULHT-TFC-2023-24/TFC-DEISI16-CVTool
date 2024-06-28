import 'package:tfc_versaofinal/models/normal_user.dart';

class ExperienciaLaboral {
  final String id;
  final String city;
  final String job;
  final String companyName;
  final String durationOfExperience;
  final NormalUser? author;

  ExperienciaLaboral({
    required this.id,
    required this.city,
    required this.job,
    required this.companyName,
    required this.durationOfExperience,
    required this.author,
  });

  factory ExperienciaLaboral.fromMap(Map<String, dynamic> map) {
    return ExperienciaLaboral(
      id: map['id'].toString(), // Ensuring id is a String
      city: map['cidade'] ?? '',
      job: map['profissao'] ?? '',
      companyName: map['nomeEmpresa'] ?? '',
      durationOfExperience: map['duracaoDaExperiencia'] ?? '',
      author: map['author'] != null ? NormalUser.fromMap(map['author']) : null, // Correctly parsing the author field
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cidade': city,
      'profissao': job,
      'nomeEmpresa': companyName,
      'duracaoDaExperiencia': durationOfExperience,
      'author': author?.toMap(),
    };
  }
}
